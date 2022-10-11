import '../Data/counter_repository.dart';
import '../Presenter/Counter_bloc/counter_bloc.dart';
import 'Models/counter_model.dart';
import 'i_counter_model_interactor.dart';

class CounterInteractor implements ICounterModelInteractor<CounterModel>{
  final CounterRepository counterRepository;
  late CounterModel? counterModel;
  CounterInteractor({required this.counterRepository});

  Future<CounterState> calculateNewState(CounterState state) async {
    if(counterModel == null) {
      await loadCounterModel();
      if(counterModel?.counter == null) {
        counterModel?.counter = 1;
      } else {
        counterModel?.counter = (counterModel?.counter)! + 1;
      }
    } else {
      counterModel?.counter = (counterModel?.counter)! + 1;
    }
    saveModel(counterModel!);
    CounterState newState = CounterState();
    newState.blopInt = (counterModel?.counter)!;
    return newState;
  }

  @override
  Future<void> saveModel(counterModel) async {
    await counterRepository.saveModel(counterModel);
  }

  Future<CounterModel?> loadCounterModel() async {
    counterModel = await counterRepository.getCounterModel();
    return counterModel;
  }
}

