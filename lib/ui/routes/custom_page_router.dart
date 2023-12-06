import 'package:flutter/material.dart';

class CustomPageRouter extends PageRouteBuilder {
  final Widget child;

  CustomPageRouter({
    required this.child,
  }) : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondayAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
