import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  // Init app
  await AppInitializer.init();

  runApp(const App());
}
