import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'service.dart';
import 'model.dart';

/////////////////////////////////////////////////////////////////////////////////////
//  <구현 성공>
//   id
//   name
//   weight
//   sprites
//
//  <구현 실패>
//   types - name
//   habitats - name
//   forms - name
/////////////////////////////////////////////////////////////////////////////////////

final dio = Dio();
final pokemonInfo = PokemonInfo(dio);

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _State();
}

class _State extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';
  String _pokemonInfo = '';
  String _pokemonImgFront ='';
  String _pokemonImgBack = '';
  // String _pokemonStats = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: 500, height: 200),
              const SizedBox(height: 40),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: 'Enter Pokemon Name',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: (){
                        _getPokemonImgUrl();
                        _getPokemonInfo();
                        // _getPokemonStats();
                      },
                    )
                ),
                onChanged: (value){
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              const SizedBox(height: 80),
              if (_pokemonImgBack.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(_pokemonImgFront),
                    Image.network(_pokemonImgBack),
                  ],)
              else
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 100),
                    SizedBox(width: 100),
                  ],
                ),
              const SizedBox(height: 30),
              Text(_pokemonInfo),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getPokemonImgUrl() async {
    try {
      final Pokemon pokemon = await pokemonInfo.getPokemon(_inputText);
      setState(() {
        _pokemonImgFront = pokemon.sprites.front_default;
        _pokemonImgBack = pokemon.sprites.back_default;
      });
    }
    catch (error) {
      setState(() {
        _pokemonImgFront = "Failed to load image";
        _pokemonImgBack = "Failed to load image";
      });
    }
  }

  Future<void> _getPokemonInfo() async {
    try {
      final Pokemon pokemon = await pokemonInfo.getPokemon(_inputText);
      setState(() {
        _pokemonInfo =
            "Name: ${pokemon.name}\n"
            "pedia ID: ${pokemon.id}\n"
            "Weight: ${pokemon.weight}kg\n";
      });
    }
    catch (error) {
      setState(() {
        _pokemonInfo = "Pokemon's info is unknown";
      });
    }
  }

  // Future<void> _getPokemonStats() async {
  //   try {
  //     final Pokemon stats = await pokemonInfo.getPokemon(_inputText);
  //     setState(() {
  //       _pokemonStats =
  //         "Type: ${stats.types.map((type) => type.type.name)}"
  //         "Habitat: ${stats.habitats.map((habitat) => habitat.habitat.name)}"
  //         "Form: ${stats.forms.map((form) => form.form.name)}";
  //     });
  //   }
  //   catch (error) {
  //     setState(() {
  //       _pokemonStats = "Stats of pokemon is undefined";
  //     });
  //   }
  // }
}