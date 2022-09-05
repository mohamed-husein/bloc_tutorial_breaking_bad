import 'package:bloc_tutorial/business/cubit/characters_cubit.dart';
import 'package:bloc_tutorial/data/model/characters_model.dart';
import 'package:bloc_tutorial/prsentation/screens/char_details_screen.dart';
import 'package:bloc_tutorial/prsentation/screens/characters_screen.dart';
import 'package:bloc_tutorial/prsentation/screens/search_screen.dart';
import 'package:bloc_tutorial/core/utils/app_strings/app_strings.dart';
import 'package:bloc_tutorial/core/services/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.charactrsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => di.sl<CharactersCubit>()..getAllCharacters(),
              child: const CharactersScreen(),
            );
          },
        );
        case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => di.sl<CharactersCubit>()..getAllCharacters(),
              child: SearchScreen(),
            );
          },
        );
      case Routes.charactersDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final characters=settings.arguments as CharactersModel ;
            return  CharactersDetailsScreen(characters: characters);
    
          },
        );

        
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text(
                AppStrings.noPageFound,
              ),
            ),
          ),
        );
    }
  }
}

class Routes {
  static const String charactrsScreen = '/';
  static const String charactersDetailsScreen = '/CharactersDetailsScreen';
  static const String searchScreen = '/SearchScreen';

}
