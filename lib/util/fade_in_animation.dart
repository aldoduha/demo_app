import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final double begin;
  final double end;
  final int duration;

  FadeInAnimation({@required this.child, this.begin, this.end, this.duration});

  @override
  _FadeInAnimationState createState() => _FadeInAnimationState(begin: this.begin, end: this.end, duration: this.duration);
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  final double begin;
  final double end;
  final int duration;

  _FadeInAnimationState({this.begin, this.end, this.duration});

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: duration));
    _animation = Tween(
      begin: begin,
      end: end,
    ).animate(_controller);

    _controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }
      else if(status == AnimationStatus.dismissed){
      }
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}