import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/counter_interactor.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  final CounterInteractor counterInteractor;

  CounterBloc({
    required this.counterInteractor
  }) : super(CounterState()) {
    on<CounterIncrementPressed>(_pressed);
  }

  Future<void> _pressed(CounterEvent e, Emitter emit) async {
    CounterState newState = CounterState();
    newState = await counterInteractor.calculateNewState(state);
    emit(newState);
  }
}
