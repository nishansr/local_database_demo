import 'package:drift/drift.dart';

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get todo => text().named('todo')();
  DateTimeColumn get dateAdded => dateTime().named('date_added')();
  BoolColumn get isCompleted => boolean().named('is_completed')();
}
