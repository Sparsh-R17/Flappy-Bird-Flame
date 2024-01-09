import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_flame/flappy_bird_game.dart';
import 'package:flappy_bird_flame/utils/constants/assets.dart';
import 'package:flappy_bird_flame/utils/enums/bird_movement.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  Bird();

  @override
  Future<void> onLoad() async {
    final birdUp = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDown = await gameRef.loadSprite(Assets.birdDownFlap);
    final birdMid = await gameRef.loadSprite(Assets.birdMidFlap);

    size = Vector2(50, 40);
    current = BirdMovement.middle;
    position = Vector2(40, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: birdMid,
      BirdMovement.up: birdUp,
      BirdMovement.down: birdDown,
    };
  }
}
