import 'dart:async';
import 'package:lesson_five/data/counter_event.dart';

final class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  final _counterEventController = StreamController<CounterEvent>();

  CounterBloc() {
    _counterEventController.stream.listen((event) {
      final counter = switch (event) {
        IncrementEvent() => _counter++,
        DecrementEvent() => _counter--,
        ResetEvent() => _counter = 0,
      };
      _counterStateController.add(counter);
    });
  }

  Stream<int> get counter => _counterStateController.stream;
  StreamSink<CounterEvent> get counterEvent => _counterEventController.sink;

  Stream<int> get number async* {
    int i = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      i++;
      yield i;
    }
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
