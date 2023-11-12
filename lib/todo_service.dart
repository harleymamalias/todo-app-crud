import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_crud/todo_item.dart';

class TodoService {

  final String  _boxName = "todoBox";

  Future<Box<ToAddItem>> get _box async => await Hive.openBox<ToAddItem>(_boxName);

  //add item
  Future<void> addItem(ToAddItem toAddItem) async {
    var box = await _box;
    await box.add(toAddItem);
  }

  //fetch item names from todo box database
  Future<List<ToAddItem>> getAllTodoItems() async {
    var box = await _box;
    return box.values.toList();
  }

  //delete item names 
  Future<void> deleteTodoItems(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  //update isCompleted to true or false
  Future<void> updateIsCompleted(int index, ToAddItem toAddItem) async {
    var box = await _box;
    toAddItem.isCompleted = !toAddItem.isCompleted;
    await box.putAt(index, toAddItem);
  }

}