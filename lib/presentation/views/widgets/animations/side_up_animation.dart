import 'package:flutter/material.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // Commence complètement en bas
              end: Offset.zero, // Termine à la position normale
            ).animate(
              CurvedAnimation(
                parent: animation,
                // Utilisation d'une courbe plus élaborée pour un mouvement plus naturel
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          opaque: false,
          barrierColor: Colors.black12,
          maintainState: true,
        );
}
