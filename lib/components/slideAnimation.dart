import 'package:flutter/material.dart';

class SlideAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Offset begin;
  final Offset end;
  final Curve curve;
  final Duration duration;

  SlideAnimatedWidget({
    required this.child,
    this.begin = const Offset(1.0, 0.0),
    this.end = Offset.zero,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _SlideAnimatedWidgetState createState() => _SlideAnimatedWidgetState();
}

class _SlideAnimatedWidgetState extends State<SlideAnimatedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
