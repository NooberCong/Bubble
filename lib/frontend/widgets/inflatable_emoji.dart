import 'dart:async';

import 'package:bubble/bloc/inflatable_widget_bloc/inflatable_widget_bloc.dart';
import 'package:bubble/core/constants/svgs.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/frontend/providers/conversation_specifics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InflatableEmoji extends StatefulWidget {
  const InflatableEmoji({Key key}) : super(key: key);

  @override
  InflatableEmojiState createState() => InflatableEmojiState();
}

class InflatableEmojiState extends State<InflatableEmoji>
    with TickerProviderStateMixin {
  AnimationController _shakeController;
  AnimationController _sizeController;
  Animation<double> _shakeAnimation;
  Animation<double> _sizeAnimation;
  bool exploded = true;
  ConversationSpecifics _specifics;
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && !exploded) {
          _shakeController.reverse();
        } else if (status == AnimationStatus.dismissed && !exploded) {
          _shakeController.repeat();
        }
      });
    _sizeController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                exploded = true;
              });
            }
            context
                .bloc<InflatableWidgetBloc>()
                .add(InflatableWidgetEvent.onAnimationStatusUpdate(status));
          });
    _shakeAnimation = Tween(begin: -0.015, end: 0.015)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(_shakeController);
    _sizeAnimation = Tween(begin: 0.3, end: 1.0)
        .chain(CurveTween(curve: Curves.easeOut))
        .animate(_sizeController)
          ..addListener(() {
            context
                .bloc<InflatableWidgetBloc>()
                .add(InflatableWidgetEvent.onSizeUpdate(currentEmojiSize()));
          });
  }

  @override
  void didChangeDependencies() {
    _specifics = ConversationSpecificsProvider.of(context).initialData;
    _streamSubscription =
        ConversationSpecificsProvider.of(context).stream.listen((event) {
      if (_shouldUpdate(event)) {
        setState(() {
          _specifics = event;
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InflatableWidgetBloc, InflatableWidgetState>(
        condition: (_, state) => state.maybeWhen(
            animate: () => true, sendEmoji: (_) => true, orElse: () => false),
        listener: (_, state) {
          state.maybeWhen(
              animate: () {
                inflate();
              },
              sendEmoji: (_) {
                if (!exploded) {
                  setState(() {
                    exploded = true;
                  });
                }
              },
              orElse: () {});
        },
        child: !exploded
            ? Align(
                alignment: Alignment.centerRight,
                child: RotationTransition(
                    turns: _shakeAnimation,
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: ScaleTransition(
                        alignment: Alignment.centerRight,
                        scale: _sizeAnimation,
                        child: SvgPicture.asset(
                          _specifics.mainEmoji,
                          color: colorForSvg(_specifics.mainEmoji,
                              Color(_specifics.themeColorCode)),
                        ),
                      ),
                    )),
              )
            : const SizedBox(
                height: .01,
              ));
  }

  void inflate() {
    setState(() {
      exploded = false;
    });
    _shakeController
      ..reset()
      ..forward();
    _sizeController
      ..reset()
      ..forward();
  }

  double currentEmojiSize() {
    return _sizeAnimation.value * 120;
  }

  @override
  void dispose() {
    _shakeController?.dispose();
    _sizeController?.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  bool _shouldUpdate(ConversationSpecifics event) {
    return event.themeColorCode != _specifics.themeColorCode ||
        event.mainEmoji != _specifics.mainEmoji;
  }
}
