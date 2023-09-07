import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../../domain/entity/user_model/user_model.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_text_styles.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_widget.dart';
import 'widgets/message_tile.dart';

@RoutePage()
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Expanded(flex: 33, child: _MessagesBlock()),
                Expanded(flex: 66, child: _ChatBlock()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MessagesBlock extends StatelessWidget {
  const _MessagesBlock();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, thickness: 1),
              itemBuilder: (BuildContext context, int index) {
                return MessageTile(
                  isSelected: false,
                  lastMessageContent:
                      'Test message to be shown in the list W W WWWW WW WW W ',
                  lastMessageTime: DateTime(2023, 9, 7, 15, 30),
                  user: const UserModel(
                    id: '123',
                    firstName: 'Dmitry',
                    lastName: 'Semenov',
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBlock extends StatelessWidget {
  const _ChatBlock();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          ChatAppBar(
            user: UserModel(id: '', firstName: 'Dmitry', lastName: 'Semenov'),
            isOnline: false,
          ),
          Expanded(
            child: ChatWidget(
              room: types.Room(
                id: '1',
                type: types.RoomType.direct,
                users: [
                  types.User(id: '123'),
                  types.User(id: 'yQcfMMlAXYYoRuKqXemHf2yx55g2'),
                ],
              ),
              patientId: '123',
            ),
          ),
        ],
      ),
    );
  }
}
