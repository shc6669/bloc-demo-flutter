import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/services/service.dart';
import 'package:bloc_flutter/bloc/albums/album_bloc.dart';
import 'package:bloc_flutter/bloc/themes/theme_bloc.dart';
import 'package:bloc_flutter/bloc/themes/theme_state.dart';
import 'package:bloc_flutter/screens/album_screen.dart';
import 'package:bloc_flutter/settings/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            title: 'Flutter Bloc Demo',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: BlocProvider(
              create: (context) =>
                  AlbumsBloc(albumsRepo: AlbumServices(), albums: []),
              child: AlbumsScreen(),
            ),
          );
        },
      ),
    );
  }
}
