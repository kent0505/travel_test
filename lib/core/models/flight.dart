import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Flight {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String departureCountry;
  @HiveField(2)
  String departureCity;
  @HiveField(3)
  String departureAirport;
  @HiveField(4)
  String departureDate;
  @HiveField(5)
  String departureTime;
  @HiveField(6)
  String arrivalCountry;
  @HiveField(7)
  String arrivalCity;
  @HiveField(8)
  String arrivalAirport;
  @HiveField(9)
  String arrivalDate;
  @HiveField(10)
  String arrivalTime;
  @HiveField(11)
  String transferCountry;
  @HiveField(12)
  String transferCity;
  @HiveField(13)
  String transferAirport;
  @HiveField(14)
  String transferDepartureDate;
  @HiveField(15)
  String transferDepartureTime;
  @HiveField(16)
  String transferArrivalDate;
  @HiveField(17)
  String transferArrivalTime;
  @HiveField(18)
  List plans;

  Flight({
    required this.id,
    required this.departureCountry,
    required this.departureCity,
    required this.departureAirport,
    required this.departureDate,
    required this.departureTime,
    required this.arrivalCountry,
    required this.arrivalCity,
    required this.arrivalAirport,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.transferCountry,
    required this.transferCity,
    required this.transferAirport,
    required this.transferDepartureDate,
    required this.transferDepartureTime,
    required this.transferArrivalDate,
    required this.transferArrivalTime,
    required this.plans,
  });
}

class FlightAdapter extends TypeAdapter<Flight> {
  @override
  final typeId = 0;

  @override
  Flight read(BinaryReader reader) {
    return Flight(
      id: reader.read(),
      departureCountry: reader.read(),
      departureCity: reader.read(),
      departureAirport: reader.read(),
      departureDate: reader.read(),
      departureTime: reader.read(),
      arrivalCountry: reader.read(),
      arrivalCity: reader.read(),
      arrivalAirport: reader.read(),
      arrivalDate: reader.read(),
      arrivalTime: reader.read(),
      transferCountry: reader.read(),
      transferCity: reader.read(),
      transferAirport: reader.read(),
      transferDepartureDate: reader.read(),
      transferDepartureTime: reader.read(),
      transferArrivalDate: reader.read(),
      transferArrivalTime: reader.read(),
      plans: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Flight obj) {
    writer.write(obj.id);
    writer.write(obj.departureCountry);
    writer.write(obj.departureCity);
    writer.write(obj.departureAirport);
    writer.write(obj.departureDate);
    writer.write(obj.departureTime);
    writer.write(obj.arrivalCountry);
    writer.write(obj.arrivalCity);
    writer.write(obj.arrivalAirport);
    writer.write(obj.arrivalDate);
    writer.write(obj.arrivalTime);
    writer.write(obj.transferCountry);
    writer.write(obj.transferCity);
    writer.write(obj.transferAirport);
    writer.write(obj.transferDepartureDate);
    writer.write(obj.transferDepartureTime);
    writer.write(obj.transferArrivalDate);
    writer.write(obj.transferArrivalTime);
    writer.write(obj.plans);
  }
}
