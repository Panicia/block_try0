// Mocks generated by Mockito 5.3.2 from annotations
// in block_try0/test/interactor_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:block_try0/Counter/Data/counter_mapper.dart' as _i2;
import 'package:block_try0/Counter/Data/counter_repository.dart' as _i6;
import 'package:block_try0/Counter/Data/counter_storage_interface.dart' as _i4;
import 'package:block_try0/Counter/Data/Models/counter_dto.dart' as _i3;
import 'package:block_try0/Counter/Domain/Models/counter_model.dart' as _i5;
import 'package:block_try0/Counter/Presenter/Counter_bloc/counter_bloc.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCounterMapper_0 extends _i1.SmartFake implements _i2.CounterMapper {
  _FakeCounterMapper_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeICounterStorage_1<T extends _i3.CounterDto> extends _i1.SmartFake
    implements _i4.ICounterStorage<T> {
  _FakeICounterStorage_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCounterModel_2 extends _i1.SmartFake implements _i5.CounterModel {
  _FakeCounterModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CounterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCounterRepository extends _i1.Mock implements _i6.CounterRepository {
  MockCounterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CounterMapper get counterMapper => (super.noSuchMethod(
        Invocation.getter(#counterMapper),
        returnValue: _FakeCounterMapper_0(
          this,
          Invocation.getter(#counterMapper),
        ),
      ) as _i2.CounterMapper);
  @override
  _i4.ICounterStorage<_i3.CounterDto> get counterStorage => (super.noSuchMethod(
        Invocation.getter(#counterStorage),
        returnValue: _FakeICounterStorage_1<_i3.CounterDto>(
          this,
          Invocation.getter(#counterStorage),
        ),
      ) as _i4.ICounterStorage<_i3.CounterDto>);
  @override
  _i7.Future<_i5.CounterModel> loadModel() => (super.noSuchMethod(
        Invocation.method(
          #loadModel,
          [],
        ),
        returnValue: _i7.Future<_i5.CounterModel>.value(_FakeCounterModel_2(
          this,
          Invocation.method(
            #loadModel,
            [],
          ),
        )),
      ) as _i7.Future<_i5.CounterModel>);
  @override
  _i7.Future<void> saveModel(_i5.CounterModel? counterModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveModel,
          [counterModel],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [CounterModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCounterModel extends _i1.Mock implements _i5.CounterModel {
  MockCounterModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get counter => (super.noSuchMethod(
        Invocation.getter(#counter),
        returnValue: 0,
      ) as int);
  @override
  set counter(int? _counter) => super.noSuchMethod(
        Invocation.setter(
          #counter,
          _counter,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [CounterState].
///
/// See the documentation for Mockito's code generation for more information.
class MockCounterState extends _i1.Mock implements _i8.CounterState {
  MockCounterState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get blopInt => (super.noSuchMethod(
        Invocation.getter(#blopInt),
        returnValue: 0,
      ) as int);
  @override
  set blopInt(int? _blopInt) => super.noSuchMethod(
        Invocation.setter(
          #blopInt,
          _blopInt,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get stateLoaded => (super.noSuchMethod(
        Invocation.getter(#stateLoaded),
        returnValue: false,
      ) as bool);
  @override
  set stateLoaded(bool? _stateLoaded) => super.noSuchMethod(
        Invocation.setter(
          #stateLoaded,
          _stateLoaded,
        ),
        returnValueForMissingStub: null,
      );
}
