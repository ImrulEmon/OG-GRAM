import 'package:og_gram/views/components/animations/lottie_animation_view.dart';
import 'package:og_gram/views/components/animations/models/lottie_animations.dart';

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.smallError,
        );
}
