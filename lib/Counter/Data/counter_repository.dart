import 'package:block_try0/Counter/Data/counter_mapper.dart';
import 'package:block_try0/Counter/Data/i_counter_model_repository.dart';
import '../Domain/Models/counter_model.dart';

class CounterRepository implements ICounterModelRepository<CounterModel>{
 final CounterMapper counterMapper = CounterMapper();

  Future<CounterModel> getCounterModel() async {
    return CounterModel(counter: null);
  }

  @override
  Future<void> saveModel(counterModel) async {

  }
}