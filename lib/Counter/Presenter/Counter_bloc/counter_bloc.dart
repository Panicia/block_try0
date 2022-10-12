import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/counter_interactor.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  final CounterInteractor counterInteractor;

  CounterBloc({
    required this.counterInteractor
  }) : super(CounterState.emptyInstance()) {

    on<CounterIncrementPressed>(_counterIncrementPressed);
    on<CounterDecrementPressed>(_counterDecrementPressed);
    on<CounterResetPressed>(_counterResetPressed);
    on<InitComplete>(_getInitState);
  }

  Future<void> _counterIncrementPressed(CounterEvent e, Emitter emit) async {
    final newState = await counterInteractor.incrementState();
    emit(newState);
  }

  Future<void> _counterDecrementPressed(CounterEvent e, Emitter emit) async {
    final newState = await counterInteractor.decrementState();
    emit(newState);
  }

  Future<void> _counterResetPressed(CounterEvent e, Emitter emit) async {
    final newState = await counterInteractor.resetState();
    emit(newState);
  }

  Future<void> _getInitState(CounterEvent e, Emitter emit) async {
    emit(await counterInteractor.getInitState());
  }
}
