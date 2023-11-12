import 'package:hive_flutter/hive_flutter.dart';
part 'todo_item.g.dart';
@HiveType(typeId: 1)
class ToAddItem {
  @HiveField(0)
  final String itemName;

  @HiveField(1, defaultValue: false)
  bool isCompleted;

  ToAddItem(
    this.itemName,
    this.isCompleted,
  );
}

// flutter packages pub rub build_runner build