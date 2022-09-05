import 'package:bloc_tutorial/core/errors/exception.dart';
import 'package:bloc_tutorial/core/utils/api_paths/api_paths.dart';
import 'package:bloc_tutorial/data/model/characters_model.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiPaths.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }

  Future<List<CharactersModel>> getAllCharacters() async {
    Response response = await dio.get(ApiPaths.charactersPath);
    if (response.statusCode == 200) {
      return List<CharactersModel>.from((response.data as List)
          .map((data) => CharactersModel.fromJson(data)));
    } else {
      throw ServerException();
    }
  }

   
}
