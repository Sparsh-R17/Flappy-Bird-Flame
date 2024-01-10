import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/src/text/renderers/text_renderer.dart';
import 'package:flame/timer.dart';
import 'package:flutter/painting.dart';
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
  bool isHit = false;
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    addAll(
      [Background(), Ground(), bird = Bird(), score = buildScore()],
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
    score.text = "Score: ${bird.score}";
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
        ),
      ),
    );
  }
}
