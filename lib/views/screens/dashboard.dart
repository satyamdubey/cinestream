import 'package:cine_stream/views/screens/movies_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          leading: const Icon(Icons.menu),
          title: const Text('CineStream'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Originals"),
              Tab(text: "Movies"),
              Tab(text: "Videos"),
              Tab(text: "Musics"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SizedBox(),
            SizedBox(),
            MoviesScreen(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
