import 'package:disney_plus/utils/services/interfaces/i_json_service.dart';
import 'package:flutter/material.dart';
import 'package:disney_plus/bindings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _jsonService = services.get<IJsonService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: const Text('Press Me'),
          onPressed: () async {
            var _movies = await _jsonService.deserializeMovies();
            print(_movies);
          },
        ),
      ],
    );
  }
}
