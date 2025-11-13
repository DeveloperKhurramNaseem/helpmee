// lib/shopeedo_material.dart
import 'package:flutter/material.dart' as m;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

// Re-export everything so the rest of the app still sees Material stuff.
export 'package:flutter/material.dart';

Future<T?> showModalBottomSheet<T>({
  required m.BuildContext context,
  required m.WidgetBuilder builder,
  bool isScrollControlled = false,
  m.Color? backgroundColor,
  m.ShapeBorder? shape,
  m.Clip? clipBehavior,
  m.Color? barrierColor,
  bool enableDrag = true,
  bool isDismissible = true,
  bool useSafeArea = false,
  bool useRootNavigator = false,
  m.RouteSettings? routeSettings,
  m.AnimationController? transitionAnimationController,
  bool showDragHandle = false,
}) {
  final isAndroid = defaultTargetPlatform == TargetPlatform.android;

  return m.showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor,
    shape: shape,
    clipBehavior: clipBehavior,
    barrierColor: barrierColor,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    showDragHandle: showDragHandle,
    builder: (ctx) {
      return m.SafeArea(
        top: false, // don’t touch top
        minimum: m.EdgeInsets.only(
          // 👇 Only Android gets extra bottom space
          bottom: isAndroid ? 16.0 : 0.0,
        ),
        child: builder(ctx),
      );
    },
  );
}
