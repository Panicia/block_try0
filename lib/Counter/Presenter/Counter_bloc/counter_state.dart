part of 'counter_bloc.dart';

abstract class BlopState {}

class CounterState extends BlopState {
  CounterState({this.blopInt = 0});
  int blopInt;
}
