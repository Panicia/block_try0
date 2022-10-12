import 'package:block_try0/Counter/Data/Storages/counter_sql_storage.dart';
import 'package:block_try0/Counter/Data/counter_mapper.dart';
import 'package:block_try0/Counter/Data/counter_storage_interface.dart';
import 'package:block_try0/Counter/Domain/counter_model_repository_interface.dart';
import '../Domain/Models/counter_model.dart';
import 'Models/counter_dto.dart';

class CounterRepository implements ICounterModelRepository<CounterModel>{
 final CounterMapper counterMapper = CounterMapper();

 final ICounterStorage counterStorage = CounterSqlStorage.instance;

  @override
  Future<CounterModel> loadModel() async {
    var counterList = await counterStorage.getDtoList();
    final CounterModel counterModel;
    if(counterList.isEmpty) {
      counterModel = counterMapper.getEmptyModel();
    } else {
      counterModel = counterMapper.fromMap(counterList[0]);
    }
    return counterModel;
  }

  @override
  Future<void> saveModel(counterModel) async {
    CounterDto counterDto = counterMapper.map(counterModel);
    counterStorage.upset(counterDto);
  }
}