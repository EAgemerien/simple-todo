import 'package:get_it/get_it.dart';
import 'package:simple_todo/features/todo/data/repositories/todo_repo_impl.dart';
import 'package:simple_todo/features/todo/data/sources/local/local_data_source.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';
import 'package:simple_todo/features/todo/domain/usecases/complete_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/create_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/delete_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/edit_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/get_todos.dart';
import 'package:simple_todo/features/todo/presentation/todo_bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //  Trying out Hive dependency injection
  //  Datasource
  sl.registerSingletonAsync<LocalDataSource>(() async {
    final hiveServices = LocalDataSourceImpl();
    await hiveServices.init();
    return hiveServices;
  });
  //  Bloc
  sl.registerFactory(
    () => TodoBloc(
      createTodo: sl(),
      completeTodo: sl(),
      deleteTodo: sl(),
      editTodo: sl(),
      getTodos: sl(),
    ),
  );

  //  Usecases
  sl.registerLazySingleton(() => CreateTodo(sl()));
  sl.registerLazySingleton(() => CompleteTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));
  sl.registerLazySingleton(() => EditTodo(sl()));
  sl.registerLazySingleton(() => GetTodos(sl()));

  //  Repo
  sl.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(localDataSource: sl()));
}

// getIt.registerSingletonAsync<ConfigService>(() async {
//     final configService = ConfigService();
//     await configService.init();
//     return configService;
//   });