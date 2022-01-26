import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/bloc/counter_bloc.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: Theme.of(context).textTheme.headline3,
              );
            },
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncremented());
                  // If this was a Cubit,
                  // `context.read<CounterCubit>().decrement(),`
                  // When using the Cubit the event `CounterIncremented` and `add` function could be avoided
                  // a function can be directly called to change the state
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecremented());
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
