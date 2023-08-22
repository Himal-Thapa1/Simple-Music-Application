import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  @override
  void onInit() async {
    super.onInit();
    await audioPlayer.setAsset('assets/empty.mp3');
    checkPermission();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  checkPermission() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
    } else {
      checkPermission();
    }
  }

  playSong(String? uri) {
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
