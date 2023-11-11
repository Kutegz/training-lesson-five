sealed class CounterEvent {}

final class IncrementEvent implements CounterEvent {}

final class DecrementEvent implements CounterEvent {}

final class ResetEvent implements CounterEvent {}
