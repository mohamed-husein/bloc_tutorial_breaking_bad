// ignore_for_file: prefer_const_constructors

import 'package:bloc_tutorial/core/app_routes/app_routes.dart';
import 'package:bloc_tutorial/core/utils/media_query/media_query_values.dart';
import 'package:bloc_tutorial/data/model/characters_model.dart';
import 'package:flutter/material.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    Key? key,
    required this.characters,
    required this.itemCount,
  }) : super(key: key);
  final List<CharactersModel> characters;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        return _characterItem(
          img: characters[index].img,
          text: characters[index].name,
          context: context,
          characters: characters[index],
        );
      },
      itemCount: itemCount,
    );
  }

  Widget _characterItem(
      {required String img,
      required String text,
      required BuildContext context,
      required CharactersModel characters}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.charactersDetailsScreen,
          arguments: characters,
        );
      },
      child: Container(
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: GridTile(
          footer: Hero(
            tag: characters.charId,
            child: Container(
              width: context.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black,
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: Colors.grey,
            child: img.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: context.width,
                    height: context.height,
                    placeholderCacheWidth: 100,
                    placeholderCacheHeight: 100,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/loading.gif',
                    image: img,
                  )
                : Image.asset(
                    'assets/images/no-image.png',
                  ),
          ),
        ),
      ),
    );
  }
}
