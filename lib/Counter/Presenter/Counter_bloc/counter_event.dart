part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}
class CounterDecrementPressed extends CounterEvent {}
class CounterResetPressed extends CounterEvent{}
class InitComplete extends CounterEvent {}
