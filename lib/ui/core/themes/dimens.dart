// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 16.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 8.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal => Dimens.paddingHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical => Dimens.paddingVertical;

  /// aspect ratio for widgets
  double get aspectRatio;

  double get smallWidgetAspectRatio;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenVertical,
  );

  /// Symmetric padding for individual elements
  EdgeInsets get elementPadding => EdgeInsets.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenHorizontal,
  );

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      print("using desktop");
      return desktop;
    }

    // Landscape mobile: apply wider horizontal padding
    if (orientation == Orientation.landscape) {
      return const _DimensMobileLandscape();
    }

    // Portrait mobile (default)
    return mobile;
  }
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  const _DimensMobile();

  @override
  double get aspectRatio => 0.5;

  @override
  double get smallWidgetAspectRatio => 1.23;
}

/// Mobile dimensions
final class _DimensMobileLandscape extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  const _DimensMobileLandscape();

  @override
  double get aspectRatio => 3.5;

  @override
  double get smallWidgetAspectRatio => 3.5;
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  const _DimensDesktop();

  @override
  double get aspectRatio => 3.5;

  @override
  double get smallWidgetAspectRatio => 1.6;
}
