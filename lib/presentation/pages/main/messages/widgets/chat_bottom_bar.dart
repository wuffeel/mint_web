import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../widgets/svg_icon_widget.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    required this.controller,
    required this.onSend,
    required this.onEmoji,
    required this.onAttach,
    required this.onAudioStop,
    super.key,
    this.isEmojiSelected = false,
    this.onTextFieldTap,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onEmoji;
  final VoidCallback onAttach;
  final void Function(types.PartialAudio) onAudioStop;
  final bool isEmojiSelected;
  final VoidCallback? onTextFieldTap;

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  late final TextEditingController _textController;
  bool _isSendButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller;
    _isSendButtonVisible = _textController.text.trim() != '';
    _textController.addListener(_handleSendVisibility);
  }

  void _handleSendVisibility() {
    setState(() {
      _isSendButtonVisible = _textController.text.trim() != '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _ChatToolbar(
              messageController: _textController,
              onAttachTap: widget.onAttach,
              onSendTap: widget.onSend,
              onEmojiTap: widget.onEmoji,
              onTextFieldTap: widget.onTextFieldTap,
              isEmojiSelected: widget.isEmojiSelected,
              isSendButtonVisible: _isSendButtonVisible,
            ),
          ),
          Offstage(
            // TODO(wuffeel): switch on audio record
            offstage: false,
            child: IconButton(
              onPressed: () {},
              icon: SvgIconWidget(
                Assets.svg.microphoneIcon,
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatToolbar extends StatelessWidget {
  const _ChatToolbar({
    required this.messageController,
    required this.onAttachTap,
    required this.onSendTap,
    required this.onEmojiTap,
    required this.isEmojiSelected,
    required this.isSendButtonVisible,
    this.onTextFieldTap,
  });

  final TextEditingController messageController;
  final VoidCallback onAttachTap;
  final VoidCallback onSendTap;
  final VoidCallback onEmojiTap;
  final bool isEmojiSelected;
  final bool isSendButtonVisible;
  final VoidCallback? onTextFieldTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: onAttachTap,
          icon: SvgIconWidget(
            Assets.svg.attachIcon,
            color: Theme.of(context).hintColor.withOpacity(0.6),
          ),
        ),
        Expanded(
          child: TextField(
            onTap: onTextFieldTap,
            controller: messageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: IconButton(
                      onPressed: onEmojiTap,
                      constraints: const BoxConstraints(),
                      icon: SvgIconWidget(
                        Assets.svg.emojiIcon,
                        color: isEmojiSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).hintColor.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSendButtonVisible,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isSendButtonVisible ? 1 : 0,
                      child: IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: onSendTap,
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              hintText: context.l10n.message,
            ),
          ),
        ),
      ],
    );
  }
}
