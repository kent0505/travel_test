part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetFlightsEvent extends HomeEvent {}

class AddFlightEvent extends HomeEvent {
  final Flight flight;
  AddFlightEvent({required this.flight});
}

class EditFlightEvent extends HomeEvent {
  final Flight flight;
  EditFlightEvent({required this.flight});
}

class DeleteFlightEvent extends HomeEvent {
  final int id;
  DeleteFlightEvent({required this.id});
}
