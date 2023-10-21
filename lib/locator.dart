import 'package:get_it/get_it.dart';
import 'package:serious/models/todo_db.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => AppDb());
}
