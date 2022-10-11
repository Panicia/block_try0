import 'package:block_try0/Counter/Data/Storages/database_helper.dart';
import 'package:block_try0/Counter/Data/counter_mapper.dart';
import 'package:block_try0/Counter/Domain/counter_model_repository_interface.dart';
import '../Domain/Models/counter_model.dart';
import 'Models/counter_dto.dart';

class CounterRepository implements ICounterModelRepository<CounterModel>{
 final CounterMapper counterMapper = CounterMapper();

 final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Future<CounterModel> loadModel() async {
    var counterList = await databaseHelper.getCounterList();
    CounterModel counterModel;
    counterList.isEmpty
        ? counterModel = CounterModel()
        : counterModel = CounterModel(counter: (counterList[0].counter)!);
    return counterModel;
  }

  @override
  Future<void> saveModel(counterModel) async {
    CounterDto counterDto = CounterDto(counter: counterModel.counter);
    var counterList = await databaseHelper.getCounterList();
    counterList.isEmpty
        ? databaseHelper.add(counterDto)
        : databaseHelper.update(counterDto);
  }
}