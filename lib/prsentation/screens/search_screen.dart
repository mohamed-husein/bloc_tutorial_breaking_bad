import 'package:bloc_tutorial/business/cubit/characters_cubit.dart';
import 'package:bloc_tutorial/prsentation/widgets/characters_list.dart';
import 'package:bloc_tutorial/prsentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  final controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: TextFieldWidget(controller: controller,),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is SearchSuccessState) {
              return CharactersList(
                characters:controller.text.isEmpty ? [] : state.charactersSearchedList,
                itemCount:controller.text.isEmpty? 0: state.charactersSearchedList.length,
              );
            }
            else if(state is SearchLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else
            {
              return const Center(
                child: Text(''),
              );
            }
          }),
    );
  }
}
