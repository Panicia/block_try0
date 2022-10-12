import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Counter_bloc/counter_bloc.dart';

class LoadingCircle extends StatefulWidget {
  const LoadingCircle({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingCircleState();
}
class _LoadingCircleState extends State<LoadingCircle>
    with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.value,
      semanticsLabel: 'Circular progress indicator',
    );
  }
}