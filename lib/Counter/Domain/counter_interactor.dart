import 'package:block_try0/Counter/Domain/counter_model_repository_interface.dart';
import '../Presenter/Counter_bloc/counter_bloc.dart';
import 'Models/counter_model.dart';

class CounterInteractor {
  final ICounterModelRepository counterRepository;
  CounterInteractor({required this.counterRepository});

  Future<CounterState> getInitState() async {
    return CounterState.loadedInstance((await loadCounterModel()).counter);
  }

  Future<CounterState> incrementState() async {
    final counterModel = await loadChangeAndSaveCounterModel(1);
    return CounterState.loadedInstance(counterModel.counter);
  }

  Future<CounterState> decrementState() async {
    final counterModel = await loadChangeAndSaveCounterModel(-1);
    return CounterState.loadedInstance(counterModel.counter);
  }

  Future<CounterState> resetState() async {
    final counterModel = await loadChangeAndSaveCounterModel(0);
    return CounterState.loadedInstance(counterModel.counter);
  }

  Future<CounterModel> loadChangeAndSaveCounterModel(int counter) async {
    final counterModel = await loadCounterModel();
    if(counter == 0) {
      counterModel.counter = 0;
    } else {
      counterModel.counter += counter;
    }
    saveCounterModel(counterModel);
    return counterModel;
  }

  Future<void> saveCounterModel(counterModel) async {
    await counterRepository.saveModel(counterModel);
  }

  Future<CounterModel> loadCounterModel() async {
    return await counterRepository.loadModel();
  }
}

