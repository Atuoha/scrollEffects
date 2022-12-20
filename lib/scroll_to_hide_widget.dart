import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget({
    Key? key,
    required this.child,
    required this.controller,
    this.duration = const Duration(
      milliseconds: 200,
    ),
  }) : super(key: key);
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  var isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      listen();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.removeListener(() {
      listen();
    });
  }

  listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else {
      hide();
    }
  }

  show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: Wrap(
        children: [widget.child],
      ),
    );
  }
}
