import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Models
import 'package:poke_api/models/pokemon.dart';

class HomeScreen extends StatefulWidget {
	const HomeScreen({super.key});

	@override
	State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	Pokemon? pokemon;
	int pokemonId = 0;

	@override
	void initState() {
		super.initState();
		nextPokemon();
	}

	Future<void> nextPokemon() async {
		pokemonId++;
		final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
		pokemon = Pokemon.fromJson(response.data);

		setState(() {});
	}

	Future<void> backPokemon() async {
		pokemonId--;
		pokemonId = (pokemonId < 1) ? 1 : pokemonId;

		final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
		pokemon = Pokemon.fromJson(response.data);

		setState(() {});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('ID del Pokemon: $pokemonId'),
			),
			body: Stack(
				children: [
					Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Text(pokemon?.name ?? 'No Name'),
								if(pokemon != null) ...[
									Image.network(pokemon!.sprites.frontDefault),
									Image.network(pokemon!.sprites.backDefault),
								]
							],
						),
					),
					Positioned(
						bottom: 20,
						right: 20,
						child: FloatingActionButton(
							onPressed: nextPokemon,
							child: const Icon(Icons.arrow_forward),
						)
					),
					Positioned(
						bottom: 20,
						left: 20,
						child: FloatingActionButton(
							onPressed: backPokemon,
							child: const Icon(Icons.arrow_back),
						)
					)
				],
			),
		);
	}
}