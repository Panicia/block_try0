import 'Models/counter_dto.dart';

abstract class ICounterStorage<T extends CounterDto> {

  Future<void> upset(CounterDto counterDto);

  Future<List<T>> getDtoList();
}