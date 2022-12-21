import 'package:flutter/material.dart';

import 'animationWidget.dart';

class InstagramEffect extends StatefulWidget {
  const InstagramEffect({Key? key}) : super(key: key);

  @override
  State<InstagramEffect> createState() => _InstagramEffectState();
}

class _InstagramEffectState extends State<InstagramEffect> {
  bool isLoved = false;
  bool isAnimating = false;
  final Duration duration = const Duration(milliseconds: 700);

  toggleReaction() {
    if (isLoved) {
      setState(() {
        isLoved = !isLoved;
      });
    } else {
      setState(() {
        isLoved = !isLoved;
        isAnimating = !isAnimating;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage(
                'https://assets.popbuzz.com/2022/47/who-plays-bianca-barclay-in-wednesday--joy-sunday-1669120206-view-0.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.white),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onDoubleTap: () => toggleReaction(),
                child: Image.network(
                  'https://www.themarysue.com/wp-content/uploads/2022/12/wednesday.jpeg',
                ),
              ),
              AnimatedOpacity(
                duration: duration,
                opacity: isAnimating ? 1 : 0,
                child: AnimationWidget(
                  isAnimating: isAnimating,
                  duration: duration,
                  onEnd: () {
                    setState(() {
                      isAnimating = false;
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: () => toggleReaction(),
            icon: Icon(
              isLoved ? Icons.favorite : Icons.favorite_border,
              size: 32,
              color: isLoved ? Colors.red : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
