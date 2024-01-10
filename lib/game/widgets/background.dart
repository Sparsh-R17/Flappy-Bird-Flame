import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../../flappy_bird_game.dart';
import '../../utils/constants/assets.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
