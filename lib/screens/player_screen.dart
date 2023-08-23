import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_dhun/constants/colors.dart';
import 'package:project_dhun/constants/text_style.dart';
import 'package:project_dhun/controllers/player_controller.dart';

class Player extends StatelessWidget {
  final SongModel data;

  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: 250,
                // width: 250,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: QueryArtworkWidget(
                  id: data.id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: double.infinity,
                  artworkWidth: double.infinity,
                  nullArtworkWidget: Icon(
                    Icons.music_note,
                    size: 48,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      data.displayNameWOExt,
                      style: myTextStyle(
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      data.artist.toString(),
                      style: myTextStyle(
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            controller.position.value,
                            style: myTextStyle(color: bgDarkColor),
                          ),
                          Expanded(
                              child: Slider(
                                  thumbColor: sliderColor,
                                  inactiveColor: bgColor,
                                  activeColor: sliderColor,
                                  value: 0.0,
                                  onChanged: (newValue) {})),
                          Text(
                            controller.duration.value,
                            style: myTextStyle(color: bgDarkColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous_rounded,
                              size: 40,
                              color: bgDarkColor,
                            )),
                        Obx(
                          () => CircleAvatar(
                            radius: 35,
                            backgroundColor: bgDarkColor,
                            child: Transform.scale(
                              scale: 2,
                              child: IconButton(
                                onPressed: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                icon: controller.isPlaying.value
                                    ? const Icon(
                                        Icons.pause,
                                        color: whiteColor,
                                      )
                                    : Icon(
                                        Icons.play_arrow_rounded,
                                        color: whiteColor,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next_rounded,
                              size: 40,
                              color: bgDarkColor,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
