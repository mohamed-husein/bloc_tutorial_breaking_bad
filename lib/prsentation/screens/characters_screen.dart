

import 'package:bloc_tutorial/business/cubit/characters_cubit.dart';
import 'package:bloc_tutorial/core/app_routes/app_routes.dart';
import 'package:bloc_tutorial/core/utils/app_strings/app_strings.dart';
import 'package:bloc_tutorial/prsentation/widgets/characters_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.searchScreen);
              },
              icon: const Icon(Icons.search))
        ],
        title: Text(
          AppStrings.appBarTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 23),
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<CharactersCubit, CharactersState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is CharactersLoadedState) {
                  return CharactersList(
                    characters: state.characters,
                    itemCount: state.characters.length,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return buildNoInternetWidget(context);
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildNoInternetWidget(context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/offline.png',width: 200,height: 200,),
            const SizedBox(
              height: 10,
            ),
            
            const Text('Can\'t connect, Check Internet',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
            
          ],
        ),
      ),
    );
  }
}
