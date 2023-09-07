import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../../../../theme/mint_text_styles.dart';

class MintChatTheme extends DefaultChatTheme {
  MintChatTheme(BuildContext context)
      : super(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          messageInsetsHorizontal: 11,
          messageInsetsVertical: 11,
          messageBorderRadius: 10,
          primaryColor: Theme.of(context).colorScheme.primary,
          secondaryColor: Theme.of(context).colorScheme.secondary,
          sentMessageBodyTextStyle: MintTextStyles.regular14.copyWith(
            color: _getMessageTextColor(context, true),
          ),
          receivedMessageBodyTextStyle: MintTextStyles.regular14.copyWith(
            color: _getMessageTextColor(context, false),
          ),
          receivedMessageDocumentIconColor: Theme.of(context).primaryColor,
          receivedMessageLinkTitleTextStyle: MintTextStyles.headline1.copyWith(
            color: Theme.of(context).primaryColor,
          ),
          receivedMessageLinkDescriptionTextStyle: MintTextStyles.figure
              .copyWith(color: Theme.of(context).primaryColor),
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
