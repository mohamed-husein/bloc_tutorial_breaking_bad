import 'package:bloc_tutorial/business/cubit/characters_cubit.dart';
import 'package:bloc_tutorial/data/repository/characters_repository.dart';
import 'package:bloc_tutorial/data/web_services/characters_web_services.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async
{
  sl.registerLazySingleton(() => CharactersWebServices());
  sl.registerLazySingleton(() => CharactersRepository(charatersWebServices: sl()));
  sl.registerFactory(() => CharactersCubit(charactersRepository: sl()));
}