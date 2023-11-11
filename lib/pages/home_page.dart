import 'package:flutter/material.dart';
import 'package:lesson_five/data/counter_bloc.dart';
import 'package:lesson_five/data/counter_event.dart';
import 'package:lesson_five/pages/profile_page.dart';

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: 0,
              stream: counterBloc.counter,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Number of times: ${snapshot.data}',
                    style: const TextStyle(fontSize: 24),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.counterEvent.add(IncrementEvent());
              },
              tooltip: 'Add',
              heroTag: 'add',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                counterBloc.counterEvent.add(DecrementEvent());
              },
              tooltip: 'Remove',
              heroTag: 'remove',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                counterBloc.counterEvent.add(ResetEvent());
              },
              tooltip: 'Reset',
              heroTag: 'reset',
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
