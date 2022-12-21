import 'package:flutter/material.dart';

class InstagramEffect extends StatefulWidget {
  const InstagramEffect({Key? key}) : super(key: key);

  @override
  State<InstagramEffect> createState() => _InstagramEffectState();
}

class _InstagramEffectState extends State<InstagramEffect> {
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
          Image.network(
            'https://www.themarysue.com/wp-content/uploads/2022/12/wednesday.jpeg',
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              size: 32,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
