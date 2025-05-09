import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_step.g.dart';

@riverpod
class CurrentStep extends _$CurrentStep {
  final int maxStep = 3;

  @override
  int build() {
    return 0;
  }

  void setStep(int step) {
    assert(step >= 0 && step <= maxStep, 'Step must be between 0 and $maxStep');

    state = step;
  }

  void nextStep() {
    if (state < maxStep) {
      state++;
    }
  }

  void previousStep() {
    if (state < maxStep) {
      state--;
    }
  }
}
