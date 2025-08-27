import 'package:flutter/material.dart';

class SlideAnimationItem extends StatefulWidget {
  final Widget child;
  final int index;
  
  const SlideAnimationItem({
    super.key, 
    required this.child,
    required this.index,
  });

  @override
  State<SlideAnimationItem> createState() => _SlideAnimationItemState();
}

class _SlideAnimationItemState extends State<SlideAnimationItem> 
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),  // Commence à droite
      end: Offset.zero,               // Termine à la position normale
    ).animate(CurvedAnimation(
      parent: _controller,
      // Utilise une courbe personnalisée pour une animation plus fluide
      curve: Curves.easeOutCubic,
    ));

    // Ajoute un délai basé sur l'index pour créer un effet cascade
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _controller,
        child: widget.child,
      ),
    );
  }
}

// Widget personnalisé pour la liste animée
class AnimatedListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const AnimatedListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return SlideAnimationItem(
          index: index,
          child: itemBuilder(context, index),
        );
      },
    );
  }
}