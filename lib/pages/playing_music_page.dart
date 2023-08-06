import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_ui/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

import '../model/song_model.dart';

class PlayingMusicPage extends StatefulWidget {
  const PlayingMusicPage({Key? key}) : super(key: key);

  @override
  State<PlayingMusicPage> createState() => _PlayingMusicPageState();
}

class _PlayingMusicPageState extends State<PlayingMusicPage> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(PageTransition(
                            child: const HomePage(), type: PageTransitionType.leftToRight
                        ));
                      },
                        child: const Icon(Icons.arrow_back_ios_new_rounded)),
                    const Text('Song'),
                    const Icon(Icons.more_vert)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30,0),
                child: Column(
                  children: [
                    Container(
                      height: 260,width: 260,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              image: AssetImage('assets/image/${Songs.songsList[2].cover}')
                          ),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(3, 3),
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 1
                            ),
                          ]
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Text(Songs.songsList[2].title,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                    Text(Songs.songsList[2].artist,
                      style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black54),),
                    const SizedBox(height: 30,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.heart),
                        Icon(Icons.playlist_add),
                        Icon(CupertinoIcons.alarm),
                        Icon(Icons.queue_music_outlined)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Slider(
                        activeColor: Colors.deepPurpleAccent,
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value)async{}
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0:00'),
                          Text('4:08'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.shuffle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.skip_previous_rounded,size: 30,),
                            const SizedBox(width: 30,),
                            FloatingActionButton(
                              onPressed: (){},
                              backgroundColor: Colors.deepPurpleAccent,
                              child: const Icon(Icons.play_arrow_rounded,size: 40,color: CupertinoColors.white,),
                            ),
                            const SizedBox(width: 30,),
                            const Icon(Icons.skip_next_rounded,size: 30,)
                          ],
                        ),
                        const Icon(Icons.equalizer_rounded,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
