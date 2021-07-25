import 'dart:math';

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
Random random = new Random();
int score = 0;
int imageCounter = random.nextInt(5);
int secondCounter = 20;
String bgMusic = 'music/background music.mp3';
String loseSound = 'music/time is over.mp3';
String playChar = 'assets/images/playScreenImages/worker.svg';
