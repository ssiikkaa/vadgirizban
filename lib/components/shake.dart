import 'package:flutter/material.dart';

class ShakeWIDGET extends StatefulWidget {
  Widget? child;
  ShakeWIDGET({
    super.key,
    this.child,
  });

  @override
  State<ShakeWIDGET> createState() => _ShakeWIDGETState();
}

class _ShakeWIDGETState extends State<ShakeWIDGET>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 50),
    )..repeat(min: 0.0,max: 0.0
        // reverse: false,
      );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            _controller!.value * 10,
            _controller!.value * 0,
          ),
          child: widget.child,
        );
      },
    );
  }
}
