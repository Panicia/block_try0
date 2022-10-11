import 'Models/counter_dto.dart';

abstract class ICounterStorage<T extends CounterDto> {

  Future<void> saveDto(T);

  Future<T> getDto();

  Future<void> updateDto(T);
}