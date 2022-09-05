import 'package:bloc_tutorial/data/model/characters_model.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({Key? key, required this.characters})
      : super(key: key);
  final CharactersModel characters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                characters.nickname,
                style: const TextStyle(color: Colors.white),
              ),
              background: Hero(
                tag: characters.charId,
                child: Image.network(
                  characters.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ',characters.jobs.join(' - ')),
                      buildDivider(),
                      characterInfo('Appeared in : ',characters.category),
                      buildDivider(),
                      characterInfo('Seasons : ',characters.apperanceSeason.join(' - ')),
                      buildDivider(),
                      characterInfo('Status : ',characters.status),
                      buildDivider(),
                      characters.betterCallSaulAppearance.isNotEmpty?
                      characterInfo('Better Call Saul Appearance : ',characters.betterCallSaulAppearance.join(' - ')):Container(),
                      characters.betterCallSaulAppearance.isNotEmpty?
                      buildDivider():Container(),
                      characterInfo('Actor/Actress  : ',characters.portrayed),
                      buildDivider(),
                


                    ],
                  ),
                ),
                const SizedBox(height: 500,)
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget characterInfo(String title,String body) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
        ),
        TextSpan(
          text: body,
          style:const TextStyle(color: Colors.white,fontSize: 16),
        ),
      ]),
      );
  }
  
  Widget buildDivider() {
    return const Divider(
      color: Colors.yellow,
      height: 30,
      thickness: 2,
    );
  }
}
