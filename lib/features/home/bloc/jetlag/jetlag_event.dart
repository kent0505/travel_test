part of 'jetlag_bloc.dart';

abstract class JetlagEvent {}

class GetJetlagEvent extends JetlagEvent {}

class AddJetlagEvent extends JetlagEvent {
  final String arrival;
  final String departure;
  final String time;
  AddJetlagEvent({
    required this.arrival,
    required this.departure,
    required this.time,
  });
}

class RemoveJetlagEvent extends JetlagEvent {}
