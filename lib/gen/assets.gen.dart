/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.png
  AssetGenImage get add => const AssetGenImage('assets/icons/add.png');

  /// File path: assets/icons/appIcon.jpg
  AssetGenImage get appIcon => const AssetGenImage('assets/icons/appIcon.jpg');

  /// File path: assets/icons/defaultHouse.png
  AssetGenImage get defaultHouse =>
      const AssetGenImage('assets/icons/defaultHouse.png');

  /// File path: assets/icons/draft.png
  AssetGenImage get draft => const AssetGenImage('assets/icons/draft.png');

  /// File path: assets/icons/forget.png
  AssetGenImage get forget => const AssetGenImage('assets/icons/forget.png');

  /// File path: assets/icons/house.png
  AssetGenImage get house => const AssetGenImage('assets/icons/house.png');

  /// File path: assets/icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icons/icon.png');

  /// File path: assets/icons/purchased.png
  AssetGenImage get purchased =>
      const AssetGenImage('assets/icons/purchased.png');

  /// File path: assets/icons/sale.png
  AssetGenImage get sale => const AssetGenImage('assets/icons/sale.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        add,
        appIcon,
        defaultHouse,
        draft,
        forget,
        house,
        icon,
        purchased,
        sale,
        user
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/otp.gif
  AssetGenImage get otp => const AssetGenImage('assets/images/otp.gif');

  /// File path: assets/images/tower.jpg
  AssetGenImage get tower => const AssetGenImage('assets/images/tower.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [otp, tower];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String intro = 'assets/intro.mp4';
  static const AssetGenImage norec = AssetGenImage('assets/norec.gif');
  static const AssetGenImage noreccustom =
      AssetGenImage('assets/noreccustom.gif');

  /// List of all assets
  static List<dynamic> get values => [intro, norec, noreccustom];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
