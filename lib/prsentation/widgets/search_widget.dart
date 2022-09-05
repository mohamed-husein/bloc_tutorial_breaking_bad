import 'package:bloc_tutorial/business/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key,required this.controller,}) : super(key: key);
 final TextEditingController controller;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (charName){
        BlocProvider.of<CharactersCubit>(context).searchedCharacters(charName);
      },
      controller:controller ,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white,fontSize: 20), 
      ),
      style: const TextStyle(color: Colors.grey,fontSize: 18) ,
    );
  }
}