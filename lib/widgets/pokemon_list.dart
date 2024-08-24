import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_rehberi/model/pokemon_model.dart';
import 'package:pokemon_rehberi/services/pokedex_api.dart';
import 'package:pokemon_rehberi/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    _pokemonListFuture = PokeApi.getPokemonData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("pokemonlist build");
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;
          return GridView.builder(
            itemCount: _listem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (context, index) {
              print("item builder");
              return PokeListItem(pokemon: _listem[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("hata var"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
