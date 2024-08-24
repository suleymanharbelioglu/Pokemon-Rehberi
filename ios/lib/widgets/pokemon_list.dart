import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/model/pokemon_model.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/services/pokedex_api.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/widgets/pokelist_item.dart';

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
