import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Plan {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  Plan({
    required this.title,
    required this.description,
  });
}

class PlanAdapter extends TypeAdapter<Plan> {
  @override
  final typeId = 1;

  @override
  Plan read(BinaryReader reader) {
    return Plan(
      title: reader.read(),
      description: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Plan obj) {
    writer.write(obj.title);
    writer.write(obj.description);
  }
}
