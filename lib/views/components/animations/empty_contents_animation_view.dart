import 'package:og_gram/views/components/animations/lottie_animation_view.dart';
import 'package:og_gram/views/components/animations/models/lottie_animations.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  EmptyContentsAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
