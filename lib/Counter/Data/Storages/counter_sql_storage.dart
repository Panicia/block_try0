import 'package:block_try0/Counter/Data/Models/counter_dto.dart';

import '../counter_storage_interface.dart';

class CounterSqlStorage implements ICounterStorage {


  @override
  Future<CounterDto> getDto() async {
    return CounterDto(counter: 0);
  }

  @override
  Future<void> saveDto(T) async {

  }

  @override
  Future<void> updateDto(T) async {
    
  }

}