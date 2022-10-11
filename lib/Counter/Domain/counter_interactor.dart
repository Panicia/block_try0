import 'package:block_try0/Counter/Domain/counter_model_repository_interface.dart';
import '../Presenter/Counter_bloc/counter_bloc.dart';
import 'Models/counter_model.dart';

class CounterInteractor {
  final ICounterModelRepository counterRepository;
  CounterInteractor({required this.counterRepository});

  Future<CounterState> getState() async {
    return CounterState(blopInt: (await loadCounterModel()).counter);
  }

  Future<CounterState> calculateNewState(CounterState state) async {
    var counterModel = await loadCounterModel();
    if(counterModel.counter > state.blopInt) {
      counterModel.counter += 1;
    } else {
      counterModel.counter = state.blopInt + 1;
    }
    saveModel(counterModel);
    CounterState newState = CounterState();
    newState.blopInt = counterModel.counter;
    return newState;
  }

  Future<void> saveModel(counterModel) async {
    await counterRepository.saveModel(counterModel);
  }

  Future<CounterModel> loadCounterModel() async {
    return await counterRepository.loadModel();
  }
}

