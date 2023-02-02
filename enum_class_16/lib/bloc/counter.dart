
import 'package:bloc/bloc.dart';

enum CounterEvent { decrement, increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) => {
          if (event == CounterEvent.decrement)
            {emit(state - 1)}
          else
            {emit(state + 1)}
        });
  }
}
