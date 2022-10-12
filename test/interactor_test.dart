import 'package:block_try0/Counter/Data/counter_repository.dart';
import 'package:block_try0/Counter/Domain/Models/counter_model.dart';
import 'package:block_try0/Counter/Domain/counter_interactor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'interactor_test.mocks.dart';

@GenerateMocks([CounterRepository])
void main() {
  group('counterInteractor_test', ()
  {
    final counterRepository = MockCounterRepository();

    var counterModel = CounterModel.empty();

    when(counterRepository.saveModel(any)).thenAnswer((_) async => {});
    when(counterRepository.loadModel()).thenAnswer((_) async => counterModel);

    final counterInteractor = CounterInteractor(
        counterRepository: counterRepository);

    test('getInitState_test', () async {
      counterModel = CounterModel.empty();
      expect((await counterInteractor.getInitState()).stateLoaded, true);
      expect((await counterInteractor.getInitState()).blopInt, 0);
    });

    test('incrementState_test', () async {
      counterModel = CounterModel.empty();
      expect((await counterInteractor.incrementState()).blopInt, 1);
      expect((await counterInteractor.incrementState()).stateLoaded, true);
    });

    test('decrementState_test', () async {
      counterModel = CounterModel.empty();
      expect((await counterInteractor.decrementState()).blopInt, -1);
      expect((await counterInteractor.decrementState()).stateLoaded, true);
    });

    test('decrementState_test', () async {
      counterModel = CounterModel.empty();
      expect((await counterInteractor.resetState()).blopInt, 0);
      expect((await counterInteractor.resetState()).stateLoaded, true);
    });

    test('loadChangeAndSaveCounterModel_test', () async {
      counterModel = CounterModel.empty();
      expect((await counterInteractor.loadChangeAndSaveCounterModel(0)).counter, 0);
      expect((await counterInteractor.loadChangeAndSaveCounterModel(1)).counter, 1);
      expect((await counterInteractor.loadChangeAndSaveCounterModel(-1)).counter, 0);
    });

    test('loadChangeAndSaveCounterModel_test', () async {
      expect((await counterInteractor.loadCounterModel()).counter, 0);
    });
  });
}