import 'package:flame/game.dart';
import 'package:flappy_bird_flame/game/screens/game_over_screen.dart';
import 'package:flappy_bird_flame/game/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

import 'flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context,_) => MainMenuScreen(game: game),
        'gameOver': (context,_) => GameOverScreen(game: game),
      },
    ),
  );
}
