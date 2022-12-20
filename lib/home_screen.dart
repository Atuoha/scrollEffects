import 'package:demo/scroll_to_hide_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          // floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              title: Text('Demo App'),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.info), text: 'About'),
                  Tab(icon: Icon(Icons.settings), text: 'Settings'),
                ],
              ),
            ),
          ],
          body: ListView.separated(
            padding: EdgeInsets.zero,
            controller: controller,  // comment this line to toggle bottomNav through scroll-direction
            itemCount: 100,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text('Number. $index'),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
          ),
        ),
      ),
      bottomSheet: ScrollToHideWidget(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Stuffs on demo'),
              ElevatedButton.icon(
                icon: const Icon(Icons.info),
                onPressed: () {},
                label: const Text('Send'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
