import 'package:flutter/material.dart';

// Screens
import 'package:poke_api/screens/home.dart';
import 'package:poke_api/screens/list.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				useMaterial3: true,
				colorSchemeSeed: Colors.deepPurple,
				appBarTheme: const AppBarTheme(elevation: 20)
			),
			home: const ListScreen(),
		);
	}
}
