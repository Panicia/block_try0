import 'Models/counter_model.dart';

abstract class ICounterModelInteractor<T extends CounterModel> {
  Future<void> saveModel(T);
}