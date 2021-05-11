import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
// import 'package:markworker/shared/variables.dart';

class MusicPlayer {
  AudioPlayer music = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  AudioCache cache = AudioCache();
  AudioPlayer picSound = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  AudioPlayer loseSound = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  static final MusicPlayer instance1 = MusicPlayer._privateConstructor();
  static final MusicPlayer instance2 = MusicPlayer._privateConstructor();
  static final MusicPlayer instance3 = MusicPlayer._privateConstructor();
  MusicPlayer._privateConstructor() {
    // You can set volume as you need
    // Since it's a background music, I set it to 0.6
    this.music.setVolume(0.6);
    this.picSound.setVolume(0.8);
    this.loseSound.setVolume(0.8);
  }
  Future playMusic(String filePath) async {
    music.stop();
    music = await cache.loop(filePath);
  }

  Future resumeMusic(String filePath) async {
    music.resume();
  }

  void pauseMusic() {
    music?.pause();
  }

  void musicStop() {
    music?.stop();
  }

  Future playPicSound(String filePath) async {
    picSound.stop();
    picSound = await cache.play(filePath);
  }

  void picSoundMute() {
    picSound?.stop();
  }

  Future playLoseSound(String filePath) async {
    loseSound.stop();
    loseSound = await cache.play(filePath);
  }

  void loseSoundMute() {
    loseSound?.stop();
  }
}
