import 'Models/counter_dto.dart';

abstract class ICounterStorage<T extends CounterDto> {

  Future<void> addDto(CounterDto counterDto);

  Future<List<T>> getDtoList();

  Future<void> updateDto(CounterDto counterDto);
}