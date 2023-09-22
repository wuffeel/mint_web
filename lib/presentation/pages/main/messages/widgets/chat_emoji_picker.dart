import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/fonts.gen.dart';

class ChatEmojiPicker extends StatelessWidget {
  const ChatEmojiPicker({
    required this.controller,
    required this.focusNode,
    required this.onBackSpace,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onBackSpace;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      child: EmojiPicker(
        config: const Config(
          columns: 14,
          emojiTextStyle: TextStyle(
            fontFamily: MintFontFamily.notoColorEmoji,
          ),
          emojiSizeMax: 20,
        ),
        onBackspacePressed: onBackSpace,
        textEditingController: controller,
      ),
    );
  }
}
