import 'package:carros/Pages/login_page.dart';
import 'package:carros/Pages/splash_page.dart';
import 'package:carros/Utils/Bus_evento.dart';
import 'package:flutter/material.dart';
import 'Blocs/favoritos_block.dart';
import 'Blocs/favoritos_block.dart';
import 'package:provider/provider.dart';
import 'Blocs/favoritos_block.dart';
import 'Blocs/favoritos_block.dart';
import 'Blocs/favoritos_block.dart';

final favoritosBloc = FavoritosBloc();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FavoritosBloc>(
          create: (context) => FavoritosBloc(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<Buss_evento>(
          create: (context) => Buss_evento(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: SplashPage(),
      ),
    );
  }
}
