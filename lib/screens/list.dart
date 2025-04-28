import 'package:flutter/material.dart';

// Screens
import 'package:poke_api/screens/detail.dart';

// Services
import 'package:poke_api/services/pokemon.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<dynamic>> pokemonList;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    pokemonList = apiService.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex')),
      body: FutureBuilder<List<dynamic>>(
        future: pokemonList,
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
            itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
            itemBuilder: (context, index) {
              final pokemon = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailScreen(url: pokemon['url'])
                  ));
                },
                child: Card(
                  child: Center(
                    child: Text(pokemon['name'].toUpperCase()),
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}