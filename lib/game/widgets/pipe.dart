import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../../flappy_bird_game.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/config.dart';
import '../../utils/enums/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.height,
    required this.pipePosition,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);

    size = Vector2(50, height);
    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
    }

    add(RectangleHitbox());
  }
}
