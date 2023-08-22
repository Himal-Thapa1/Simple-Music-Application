import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_dhun/constants/colors.dart';
import 'package:project_dhun/constants/text_style.dart';
import 'package:project_dhun/controllers/player_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
            onPressed: () {
              //LEFT BLANK FOR NOW
            },
            icon: Icon(
              Icons.search,
              color: bgColor,
            ),
          ),
        ],
        title: Text(
          "Dhun",
          style: myTextStyle(),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.data!.isEmpty) {
            return Center(
                child: Text(
              "No song found.",
              style: myTextStyle(),
            ));
          } 
          else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: bgColor,
                      title: Text(
                        "${snapshot.data![index].displayNameWOExt}",
                        style: myTextStyle(
                          size: 14,
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data![index].artist}",
                        style: myTextStyle(
                          size: 12,
                        ),
                      ),
                      leading: const Icon(
                        Icons.music_note,
                        color: whiteColor,
                        size: 32,
                      ),
                      trailing: const Icon(
                        Icons.play_arrow,
                        color: whiteColor,
                        size: 26,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
