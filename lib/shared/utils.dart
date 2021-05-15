import 'dart:math';

// import 'package:path_drawing/path_drawing.dart';
// import 'package:flutter/material.dart';

bool isSoundEnabled = true;
bool isMusicEnabled = true;
bool isLangChanged = true;
bool isPlaying = false;

List<String> unfilledImages = [
  'assets/images/playScreenImages/timer.svg',
  'assets/images/playScreenImages/cup.svg',
  'assets/images/playScreenImages/ball.svg',
  'assets/images/playScreenImages/whistle.svg',
  'assets/images/playScreenImages/flag.svg',
];
List<String> filledImages = [
  'assets/images/playScreenImages/timer_p.svg',
  'assets/images/playScreenImages/cup_p.svg',
  'assets/images/playScreenImages/ball_p.svg',
  'assets/images/playScreenImages/whistle_p.svg'
      'assets/images/playScreenImages/flag_p.svg'
];
Random random = new Random();
int score = 0;
int imageCounter = 1;
int secondCounter = 200;
bool isPainted = false;
String bgMusic = 'music/background music.mp3';
String loseSound = 'music/time is over.mp3';
