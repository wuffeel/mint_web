import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_text_styles.dart';
import '../../../bloc/chat_room/chat_room_bloc.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_widget.dart';
import 'widgets/message_tile.dart';

@RoutePage()
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ChatRoomBloc>()..add(ChatRoomListFetchRequested()),
        ),
        BlocProvider(create: (context) => getIt<ChatBloc>()),
      ],
      child: const _MessagesView(),
    );
  }
}

class _MessagesView extends StatelessWidget {
  const _MessagesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
                    builder: (context, state) {
                      if (state is ChatRoomListLoading) {
                        return const _MessagesBlockContainer(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (state is ChatRoomListFetchSuccess) {
                        if (state.roomList.isEmpty) {
                          return const _MessagesBlockContainer(
                            child: Center(
                              child: Text('No chat with patients yet!'),
                            ),
                          );
                        }
                        return BlocBuilder<ChatBloc, ChatState>(
                          builder: (context, chatState) {
                            return _MessagesBlock(
                              roomList: state.roomList,
                              senderId: state.senderId,
                              selectedRoom:
                                  chatState is ChatFetchMessagesSuccess
                                      ? chatState.room
                                      : null,
                            );
                          },
                        );
                      }
                      return const SizedBox.expand(
                        child: _MessagesBlockContainer(),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 66,
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      if (state is ChatLoading) {
                        return const _ChatBlockContainer(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (state is ChatFetchMessagesSuccess) {
                        return _ChatBlock(
                          room: state.room,
                          senderId: state.senderId,
                        );
                      }
                      return const SizedBox.expand(
                        child: _ChatBlockContainer(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MessagesBlockContainer extends StatelessWidget {
  const _MessagesBlockContainer({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final messagesWidget = child;
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(l10n.messages, style: MintTextStyles.semiBold18),
          ),
          const SizedBox(height: 20),
          if (messagesWidget != null) Expanded(child: messagesWidget),
        ],
      ),
    );
  }
}

class _MessagesBlock extends StatelessWidget {
  const _MessagesBlock({
    required this.roomList,
    required this.senderId,
    this.selectedRoom,
  });

  final List<types.Room> roomList;
  final String senderId;
  final types.Room? selectedRoom;

  void _initializeChat(BuildContext context, types.Room room) {
    context.read<ChatBloc>().add(ChatInitializeRequested(room));
  }

  @override
  Widget build(BuildContext context) {
    final currentRoom = selectedRoom;
    return _MessagesBlockContainer(
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1),
        itemBuilder: (BuildContext context, int index) {
          final room = roomList[index];
          final user = room.users.firstWhere((e) => e.id != senderId);
          final isSelected = currentRoom != null && currentRoom.id == room.id;
          return MessageTile(
            isSelected: isSelected,
            lastMessage: (room.lastMessages?.isNotEmpty ?? false)
                ? room.lastMessages?.last
                : null,
            user: UserModel(
              id: user.id,
              firstName: user.firstName,
              lastName: user.lastName,
              photoUrl: user.imageUrl,
            ),
            onTap: !isSelected
                ? () => _initializeChat(context, roomList[index])
                : null,
          );
        },
        itemCount: roomList.length,
      ),
    );
  }
}

class _ChatBlockContainer extends StatelessWidget {
  const _ChatBlockContainer({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: child,
    );
  }
}

class _ChatBlock extends StatelessWidget {
  const _ChatBlock({required this.room, required this.senderId});

  final types.Room room;
  final String senderId;

  @override
  Widget build(BuildContext context) {
    final patient = room.users.firstWhere((user) => user.id != senderId);
    return _ChatBlockContainer(
      child: Column(
        children: <Widget>[
          ChatAppBar(
            user: UserModel(
              id: patient.id,
              firstName: patient.firstName,
              lastName: patient.lastName,
              photoUrl: patient.imageUrl,
            ),
            isOnline: false,
          ),
          Expanded(child: ChatWidget(room: room, senderId: senderId)),
        ],
      ),
    );
  }
}
