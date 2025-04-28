import 'package:flutter/material.dart';

// Models
import 'package:poke_api/models/pokemon.dart';

// Services
import 'package:poke_api/services/pokemon.dart';

class DetailScreen extends StatefulWidget {
  final String url;

  const DetailScreen({super.key, required this.url});

  @override
  State<DetailScreen> createState() => DetailtScreenState();
}

class DetailtScreenState extends State<DetailScreen> {
  Pokemon? pokemon;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    getPokemon();
  }

  Future<void> getPokemon() async {
    pokemon = await apiService.getPokemonDetailByUrl(widget.url);
    print(pokemon?.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del pokemon')),
      body: null // ACA CONSTRUYO MI PÀGINA
    );
  }
}