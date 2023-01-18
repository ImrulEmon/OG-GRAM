import 'package:og_gram/views/components/animations/lottie_animation_view.dart';
import 'package:og_gram/views/components/animations/models/lottie_animations.dart';

class DataNotFoundAnimationView extends LottieAnimationView {
  DataNotFoundAnimationView({super.key})
      : super(
          animation: LottieAnimation.dataNotFound,
        );
}