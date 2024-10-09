part of 'jetlag_bloc.dart';

abstract class JetlagState {}

class JetlagInitial extends JetlagState {}

class JetlagLoadedState extends JetlagState {
  final String arrival;
  final String departure;
  final String time;

  JetlagLoadedState({
    required this.arrival,
    required this.departure,
    required this.time,
  });
}
