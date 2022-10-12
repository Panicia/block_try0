import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Counter_bloc/counter_bloc.dart';
import '../Widgets/counter_widget.dart';
import '../Widgets/loading_circle.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});
  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    context.read<CounterBloc>().add(InitComplete());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
        BlocConsumer<CounterBloc, CounterState>(
          builder: (context, state) {
            if(!state.stateLoaded) {
              return const LoadingCircle();
            }
            else {
              return loadedWidget(context);
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}


Widget loadedWidget(BuildContext context){
  return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    const Text(
      'You have pushed the button this many times:',
    ),
    const CounterWidget(),
    Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => context.read<CounterBloc>().add(CounterIncrementPressed()),
            child: const Text('Increment'),
          ),
          const SizedBox(width: 20),
          TextButton(
              onPressed: () => context.read<CounterBloc>().add(CounterDecrementPressed()),
              child: const Text('Decrement')
          ),
          const SizedBox(width: 20),
          TextButton(
              onPressed: () => context.read<CounterBloc>().add(CounterResetPressed()),
              child: const Text('Reset')
          )
        ]
    )
  ],
);
}