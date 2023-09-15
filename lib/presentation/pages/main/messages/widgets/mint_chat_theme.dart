import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../../../../gen/fonts.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class MintChatTheme extends DefaultChatTheme {
  MintChatTheme(BuildContext context)
      : super(
          inputTextStyle: const TextStyle(
            fontSize: 16,
            fontFamilyFallback: [MintFontFamily.notoColorEmoji],
          ),
          messageInsetsHorizontal: 11,
          messageInsetsVertical: 11,
          messageBorderRadius: 10,
          primaryColor: Theme.of(context).colorScheme.primary,
          receivedEmojiMessageTextStyle: const TextStyle(
            fontSize: 40,
            fontFamily: MintFontFamily.notoColorEmoji,
          ),
          receivedMessageBodyTextStyle: MintTextStyles.regular14.copyWith(
            color: _getMessageTextColor(context, false),
            fontFamilyFallback: [MintFontFamily.notoColorEmoji],
          ),
          receivedMessageDocumentIconColor: Theme.of(context).primaryColor,
          receivedMessageLinkTitleTextStyle: MintTextStyles.headline1.copyWith(
            color: Theme.of(context).primaryColor,
          ),
          receivedMessageLinkDescriptionTextStyle: MintTextStyles.figure
              .copyWith(color: Theme.of(context).primaryColor),
          secondaryColor: Theme.of(context).colorScheme.secondary,
          sentEmojiMessageTextStyle: const TextStyle(
            fontSize: 40,
            fontFamily: MintFontFamily.notoColorEmoji,
          ),
          sentMessageBodyTextStyle: MintTextStyles.regular14.copyWith(
            color: _getMessageTextColor(context, true),
            fontFamilyFallback: [MintFontFamily.notoColorEmoji],
          ),
        );

  static bool _isThemeDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color _getMessageTextColor(BuildContext context, bool isSender) {
    return _isThemeDark(context)
        ? Colors.white
        : isSender
            ? Colors.white
            : Colors.black;
  }
}
