import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flappy_bird_flame/game/widgets/background.dart';
import 'package:flappy_bird_flame/game/widgets/bird.dart';
import 'package:flappy_bird_flame/game/widgets/ground.dart';
import 'package:flappy_bird_flame/game/widgets/pipe_group.dart';
import 'package:flappy_bird_flame/utils/constants/config.dart';

class FlappyBirdGame extends FlameGame {
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
        bird = Bird(),
      ],
    );

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
