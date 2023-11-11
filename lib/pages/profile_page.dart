import 'package:flutter/material.dart';
import 'package:lesson_five/data/counter_bloc.dart';

final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
          child: StreamBuilder(
              stream: counterBloc.number,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return Text(
                  'Number: ${snapshot.data}',
                  style: const TextStyle(fontSize: 24),
                );
              })),
    );
  }
}
