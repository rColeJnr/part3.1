import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'App09Main.dart';

extension MyHomePageStateExtension on MyHomePageState {
  Animation getAnimation(AnimationController controller) {
    Tween tween = Tween<double>(begin: 100.0, end: 500.0);
    Animation animation = tween.animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    return animation;
  }

  Widget buildPositionedWidget() {
    return Positioned(
      left: 150.0,
      top: animation.value,
      child: Icon(
        Icons.music_note,
        size: 70.0,
      ),
    );
  }
}
