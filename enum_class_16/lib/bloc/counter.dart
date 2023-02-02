import 'package:bloc/bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initial) : super(initial) {
    on<DecrementCounter>((event, emit) {
      emit((state - 1) * event.value);
    });

    on<IncrementCounter>((event, emit) {
      emit((state + 1) * event.value);
    });
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
