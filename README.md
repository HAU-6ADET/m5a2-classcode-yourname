# Module 5 - Activity 2 - Catch a monster (Flutter)

[![Made with Claude](https://img.shields.io/badge/Made_with-Claude-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)

Take input from the user. Build a screen that lets you "catch" monsters by name.

## Build this

In `lib/catch_screen.dart`, make `CatchScreen` a `StatefulWidget` with:

- a `TextField` to type a name,
- an `ElevatedButton` labelled `Catch`,
- a `Text` keyed `Key('count')` showing how many are caught (starts at 0),
- the caught names shown on screen.

Catching a non-empty name adds it; a blank name is ignored.

Research: `TextEditingController`, `TextField`, `String.trim()`, updating a
`List` in `setState`.

## Run and check

```bash
flutter pub get
flutter run
flutter test
```

## Submit

Fill in `student.json`, commit, and push.
