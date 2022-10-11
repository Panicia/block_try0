import '../Domain/Models/counter_model.dart';
import 'Models/counter_dto.dart';

class CounterMapper {

 CounterDto map(CounterModel counterModel) {
   return CounterDto(counter: counterModel.counter);
 }

 CounterModel getEmptyModel() {
   return CounterModel();
 }

 CounterModel fromMap(CounterDto counterDto) {
   CounterModel counterModel;
   counterDto.counter == null
       ? counterModel = CounterModel()
       : counterModel = CounterModel(counter: counterDto.counter!);
   return counterModel;
 }
}