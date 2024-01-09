import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_flame/flappy_bird_game.dart';
import 'package:flappy_bird_flame/game/widgets/pipe.dart';
import 'package:flappy_bird_flame/utils/constants/config.dart';
import 'package:flappy_bird_flame/utils/enums/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _rand = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    final heightAboveGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _rand.nextDouble() * (heightAboveGround / 4);
    final centerY = spacing + _rand.nextDouble() * (heightAboveGround - spacing);
    addAll(
      [
        Pipe(height: centerY - spacing/2, pipePosition: PipePosition.top),
        Pipe(height: heightAboveGround - (centerY + spacing /2 ), pipePosition: PipePosition.bottom),
      ],
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= Config.gameSpeed * dt;
  }
}
