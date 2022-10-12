part of 'counter_bloc.dart';

abstract class BlopState {}

class CounterState extends BlopState {
  CounterState({this.blopInt = 0, this.stateLoaded = false});
  int blopInt;
  bool stateLoaded = false;
  factory CounterState.emptyInstance() => CounterState();
  factory CounterState.loadedEmptyInstance() => CounterState(stateLoaded: true);
  factory CounterState.loadedInstance(int counter) => CounterState(blopInt: counter, stateLoaded: true);
}
