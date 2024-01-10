import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird_flame/utils/constants/config.dart';
import 'package:flutter/material.dart';
import '../../flappy_bird_game.dart';
import '../../utils/constants/assets.dart';
import '../../utils/enums/bird_movement.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;

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

    add(CircleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      ),
    );
    current = BirdMovement.up;
    FlameAudio.play(Assets.flying);
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    gameRef.isHit = true;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }
}
