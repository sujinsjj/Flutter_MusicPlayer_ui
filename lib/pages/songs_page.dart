import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_ui/model/song_model.dart';
import 'package:music_player_ui/pages/playing_music_page.dart';
import 'package:page_transition/page_transition.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(CupertinoIcons.shuffle_medium,color: Colors.deepPurpleAccent,),
                const SizedBox(width: 15,),
                Text('Shuffle All (${Songs.songsList.length.toString()})',style: const TextStyle(fontSize: 16),)
              ],
            ),
            const Row(
              children: [
                Icon(CupertinoIcons.sort_up,size: 26,),
                SizedBox(width: 20,),
                Icon(Icons.list,size: 26,),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Songs.songsList.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 55,height: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/image/${Songs.songsList[index].cover}'))
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  children: [
                                    Text(Songs.songsList[index].title,style: const TextStyle(fontSize: 18)),
                                    Text(Songs.songsList[index].artist,
                                      style: const TextStyle(
                                          fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w500),),
                                  ],
                                )
                              ],
                            ),
                            const Icon(Icons.more_vert)
                          ],
                        ),
                      );
                    }
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
          Positioned(
            bottom: 0,left: 0,right: 0,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(PageTransition(
                      child: const PlayingMusicPage(), type: PageTransitionType.bottomToTop
                  ));
                },
                child: Container(
                  height: 57,
                  color: CupertinoColors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 55,height: 55,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/image/${Songs.songsList[2].cover}'))
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Songs.songsList[2].title,style: const TextStyle(fontSize: 18)),
                              Text(Songs.songsList[2].artist,style: const TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w500),),
                            ],
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(CupertinoIcons.play_arrow_solid,color: Colors.deepPurpleAccent,),
                          SizedBox(width: 40,),
                          Icon(Icons.queue_music_outlined,color: Colors.deepPurpleAccent,),
                          SizedBox(width: 20,)
                        ],
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
