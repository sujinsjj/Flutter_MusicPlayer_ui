import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player_ui/pages/songs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.white
                ],
              )
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            toolbarHeight: 150,
              title: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu,color: Colors.white,),
                      const SizedBox(width: 15,),
                      Text('Music Player',
                        style: GoogleFonts.charm(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    height: 45,
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search_rounded,color: Colors.deepPurpleAccent,),
                        SizedBox(width: 5,),
                        Text('Search song...',style:TextStyle(
                          color: Colors.grey,fontSize: 17
                        ))
                      ],
                    ),
                  )
                ],
              ),
              bottom: TabBar(
                isScrollable: true,
                  labelStyle: const TextStyle(fontSize: 17),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(
                      child: Text('Songs'),
                    ),
                    Tab(
                      child: Text('Playlist'),
                    ),
                    Tab(
                      child: Text('Albums'),
                    ),
                    Tab(
                      child: Text('Artists'),
                    ),
                    Tab(
                      child: Text('Genres'),
                    ),
                  ]
              ),
            ),
            body: const TabBarView(
                children: [
                  SongsPage()
                ]
            ),
          ),
        )
      ],
    );
  }
}
