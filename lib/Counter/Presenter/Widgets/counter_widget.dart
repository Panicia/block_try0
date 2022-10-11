import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Counter_bloc/counter_bloc.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CounterWidgetState();
}
class _CounterWidgetState extends State<CounterWidget> {

  @override
  void initState() {
    super.initState();
    context.read<CounterBloc>().add(InitComplete());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text('${state.blopInt}',
          style: Theme.of(context).textTheme.headline4,
        );
      },
      listener: (context, state) {},
    );
  }
}