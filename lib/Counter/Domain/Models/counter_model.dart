class CounterModel {
 CounterModel({this.counter = 0});
 int counter;

 factory CounterModel.empty() =>
     CounterModel(counter: 0);
}