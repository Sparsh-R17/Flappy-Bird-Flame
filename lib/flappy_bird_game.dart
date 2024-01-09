import 'package:flame/game.dart';
import 'package:flappy_bird_flame/game/widgets/background.dart';
import 'package:flappy_bird_flame/game/widgets/ground.dart';

class FlappyBirdGame extends FlameGame {
  FlappyBirdGame();

  @override
  Future<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
      ],
    );
  }
}
