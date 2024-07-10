import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StartWorkoutCaroselcontainer1 extends StatefulWidget {
  const StartWorkoutCaroselcontainer1({super.key});

  @override
  State<StartWorkoutCaroselcontainer1> createState() =>
      _HomeCaroselcontainer1State();
}

class _HomeCaroselcontainer1State extends State<StartWorkoutCaroselcontainer1> {
  final videourl = "https://youtu.be/J212vz33gU4?si=cp2DT-HWP49Uj2hq";

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videourl);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // SizedBox(
      //   height: 20,
      // ),
      Container(
        clipBehavior: Clip.antiAlias,
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: YoutubePlayer(
          controller: youtubePlayerController,
          showVideoProgressIndicator: true,
        ),
      ),
      // Positioned(
      //     bottom: 45,
      //     right: 75,
      //     child: Column(
      //       children: [
      //         Text(
      //           "Balanced Burn",
      //           style: GoogleFonts.poppins(
      //               fontWeight: FontWeight.w800,
      //               fontSize: 17,
      //               color: Colors.white),
      //         ),
      //         Text(
      //           "3 week | 40 min | Arms | Back",
      //           style: GoogleFonts.poppins(
      //               fontWeight: FontWeight.w600,
      //               fontSize: 14,
      //               color: Colors.white),
      //         )
      //       ],
      //     ))
    ]);
  }
}
