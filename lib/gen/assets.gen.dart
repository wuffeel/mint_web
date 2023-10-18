/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/actions_vertical.svg
  SvgGenImage get actionsVertical =>
      const SvgGenImage('assets/svg/actions_vertical.svg');

  /// File path: assets/svg/arrow_down.svg
  SvgGenImage get arrowDown => const SvgGenImage('assets/svg/arrow_down.svg');

  /// File path: assets/svg/attach_icon.svg
  SvgGenImage get attachIcon => const SvgGenImage('assets/svg/attach_icon.svg');

  /// File path: assets/svg/back_button.svg
  SvgGenImage get backButton => const SvgGenImage('assets/svg/back_button.svg');

  /// File path: assets/svg/bell_icon.svg
  SvgGenImage get bellIcon => const SvgGenImage('assets/svg/bell_icon.svg');

  /// File path: assets/svg/cross_icon.svg
  SvgGenImage get crossIcon => const SvgGenImage('assets/svg/cross_icon.svg');

  /// File path: assets/svg/emoji_icon.svg
  SvgGenImage get emojiIcon => const SvgGenImage('assets/svg/emoji_icon.svg');

  /// File path: assets/svg/filter_icon.svg
  SvgGenImage get filterIcon => const SvgGenImage('assets/svg/filter_icon.svg');

  /// File path: assets/svg/google_icon.svg
  SvgGenImage get googleIcon => const SvgGenImage('assets/svg/google_icon.svg');

  /// File path: assets/svg/microphone_icon.svg
  SvgGenImage get microphoneIcon =>
      const SvgGenImage('assets/svg/microphone_icon.svg');

  /// File path: assets/svg/mint_logo.svg
  SvgGenImage get mintLogo => const SvgGenImage('assets/svg/mint_logo.svg');

  /// File path: assets/svg/notification_tile_icon.svg
  SvgGenImage get notificationTileIcon =>
      const SvgGenImage('assets/svg/notification_tile_icon.svg');

  /// File path: assets/svg/phone_icon.svg
  SvgGenImage get phoneIcon => const SvgGenImage('assets/svg/phone_icon.svg');

  /// File path: assets/svg/refresh_icon.svg
  SvgGenImage get refreshIcon =>
      const SvgGenImage('assets/svg/refresh_icon.svg');

  /// File path: assets/svg/sort_icon.svg
  SvgGenImage get sortIcon => const SvgGenImage('assets/svg/sort_icon.svg');

  /// File path: assets/svg/user_placeholder.svg
  SvgGenImage get userPlaceholder =>
      const SvgGenImage('assets/svg/user_placeholder.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        actionsVertical,
        arrowDown,
        attachIcon,
        backButton,
        bellIcon,
        crossIcon,
        emojiIcon,
        filterIcon,
        googleIcon,
        microphoneIcon,
        mintLogo,
        notificationTileIcon,
        phoneIcon,
        refreshIcon,
        sortIcon,
        userPlaceholder
      ];
}

class Assets {
  Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
