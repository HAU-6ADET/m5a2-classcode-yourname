import 'package:flutter/material.dart';

/// Module 5 - Activity 2 - Catch a monster
///
/// Take input from the user. `CatchScreen` is a `StatefulWidget` with:
///
///   * a `TextField` to type a monster name,
///   * an `ElevatedButton` labelled `Catch`,
///   * a `Text` keyed `Key('count')` showing how many you have caught
///     (for example "Caught: 2"), starting at 0,
///   * the caught names shown on screen (each name a `Text`).
///
/// Tapping Catch with a non-empty name adds it (and clears the field is nice).
/// A blank or whitespace-only name is ignored.
///
/// Concepts to research: `TextEditingController`, `TextField`, reading
/// `controller.text`, `String.trim()`, and updating a `List` in `setState`.
class CatchScreen extends StatefulWidget {
  const CatchScreen({super.key});

  @override
  State<CatchScreen> createState() => _CatchScreenState();
}

class _CatchScreenState extends State<CatchScreen> {
  // TODO: a TextEditingController and a List<String> of caught names.

  @override
  Widget build(BuildContext context) {
    // TODO: TextField + Catch button + Key('count') + the caught names.
    return Scaffold(
      appBar: AppBar(title: const Text('Catch')),
      body: const Center(child: Text('Caught: 0', key: Key('count'))),
    );
  }
}
