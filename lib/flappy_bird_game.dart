import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'game/widgets/background.dart';
import 'game/widgets/bird.dart';
import 'game/widgets/ground.dart';
import 'game/widgets/pipe_group.dart';
import 'utils/constants/config.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(
    Config.pipeInterval,
    repeat: true,
  );

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
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
