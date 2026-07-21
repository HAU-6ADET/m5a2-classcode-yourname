import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'catch_screen.dart';

// Entry point. Run it and catch a few monsters. Your work is in
// `catch_screen.dart`.
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const HaudexApp(),
    ),
  );
}

class HaudexApp extends StatelessWidget {
  const HaudexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const CatchScreen(),
    );
  }
}
