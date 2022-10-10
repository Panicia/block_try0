import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Counter/Data/counter_repository.dart';
import 'Counter/Domain/counter_interactor.dart';
import 'Counter/Presenter/Counter_bloc/counter_bloc.dart';
import 'Counter/Presenter/Screens/counter_screen.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    final CounterRepository counterRepository = CounterRepository();
    final CounterInteractor counterInteractor = CounterInteractor(counterRepository: counterRepository);

    return BlocProvider<CounterBloc>(
        create: (_) => CounterBloc(counterInteractor: counterInteractor),
        child: MaterialApp(
          title: 'Counter CA',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CounterScreen(title: 'Counter Screen'),
        )
    );
  }
}

