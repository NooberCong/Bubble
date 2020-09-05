import 'package:flutter/material.dart';

import 'cached_image.dart';

class JumpingDots extends StatefulWidget {
  final int numberOfDots;
  final String imageUrl;
  const JumpingDots({Key key, this.numberOfDots = 3, this.imageUrl})
      : super(key: key);
  @override
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
    with TickerProviderStateMixin {
  List<AnimationController> _animationControllers;
  List<Animation<double>> _animations;
  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CachedCircularImage(
            imageUrl: widget.imageUrl,
            radius: 15,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade800
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.numberOfDots, (index) {
              //AnimatedBuilder widget will rebuild it self when
              //_animationControllers[index] value changes.
              return AnimatedBuilder(
                animation: _animationControllers[index],
                builder: (context, child) {
                  return Container(
                    padding: const EdgeInsets.all(2.5),
                    //Transform widget's translate constructor will help us to move the dot
                    //in upward direction by changing the offset of the dot.
                    //X-axis position of dot will not change.
                    //Only Y-axis position will change.
                    child: Transform.translate(
                      offset: Offset(0, _animations[index].value),
                      child: const DotWidget(),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _initAnimation() {
    ///initialization of _animationControllers
    ///each _animationController will have same animation duration
    _animationControllers = <AnimationController>[];
    _animations = <Animation<double>>[];

    ///initialization of _animations
    ///here end value is -20
    ///end value is amount of jump.
    ///and we want our dot to jump in upward direction
    for (var i = 0; i < widget.numberOfDots; i++) {
      _animationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 250))
        ..addStatusListener((status) {
          //On Complete
          if (status == AnimationStatus.completed) {
            //return of original postion
            _animationControllers[i].reverse();
            //if it is not last dot then start the animation of next dot.
          }
          //if last dot is back to its original postion then start animation of the first dot.
          // now this animation will be repeated infinitely
          if (i == widget.numberOfDots - 1 &&
              status == AnimationStatus.dismissed) {
            _animationControllers[0].forward();
          }
          if (i != widget.numberOfDots - 1 && _animations[i].value <= -1) {
            _animationControllers[i + 1].forward();
          }
        }));
      _animations.add(
          Tween<double>(begin: 2, end: -4).animate(_animationControllers[i]));
    }
    //trigger animtion of first dot to start the whole animation.
    _animationControllers.first.forward();
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      height: 5,
      width: 5,
    );
  }
}
