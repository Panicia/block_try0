import '../Domain/Models/counter_model.dart';

abstract class ICounterModelRepository<T extends CounterModel> {
  Future<void> saveModel(T);
}