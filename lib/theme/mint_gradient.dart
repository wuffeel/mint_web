import 'package:flutter/cupertino.dart';

import '../gen/colors.gen.dart';

class MintGradient {
  static const authGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MintColors.gradientDark,
      MintColors.gradientLight
    ],
  );
}
