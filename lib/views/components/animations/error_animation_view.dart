import 'package:og_gram/views/components/animations/lottie_animation_view.dart';
import 'package:og_gram/views/components/animations/models/lottie_animations.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
          reverse: true,
        );
}
