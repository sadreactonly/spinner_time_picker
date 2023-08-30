
# Flutter Spinner Time Picker

A Flutter package providing custom time picker widgets for easy time selection in your Flutter applications.

[![pub](https://img.shields.io/pub/v/flutter_spinner_time_picker.svg)](https://pub.dev/packages/flutter_spinner_time_picker)
[![license: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter package providing custom time picker widgets for easy time selection in your Flutter applications.

## Preview

### Dark Mode

<img src="https://github.com/hosseinvejdani/flutter_spinner_time_picker/assets/18458798/1c518bb6-b0d5-4ecc-a8d1-fb2d566444b6" alt="Time Picker Example - dark mode" width="400">

## Light Mode

<img src="https://github.com/hosseinvejdani/flutter_spinner_time_picker/assets/18458798/c645e893-3949-48d3-b204-9041a2f20d85" alt="Time Picker Example - light mode" width="400">


## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_spinner_time_picker: ^0.1.0
```

## Usage

Import the package:

```dart
import 'package:flutter_spinner_time_picker/flutter_spinner_time_picker.dart';
```

### How to use

Example usage:

```dart
TimeOfDay selectedTime = TimeOfDay.now();

void _showTimePicker() async {
  final pickedTime = await showSpinnerTimePicker(
    context,
    initTime: selectedTime,
  );

  if (pickedTime != null) {
    setState(() {
      selectedTime = pickedTime;
    });
  }
}
```


## Fully customizable package

```dart
showSpinnerTimePicker(
  context,
  title: 'Custom Time Picker',
  backgroundColor: Colors.grey[100],
  foregroundColor: Colors.black,
  titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  buttonStyle: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
  ),
  buttonTextStyle: TextStyle(fontSize: 16, color: Colors.white),
  barrierDismissible: true,
  // ... other customization options
);

```


## Complete Example

Here's a simple example of how to use the custom time picker widgets:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_spinner_time_picker/flutter_spinner_time_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Picker Example',
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  void _showTimePicker() async {
    final pickedTime = await showSpinnerTimePicker(
      context,
      initTime: selectedTime,
      is24HourFormat: false,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selected Time:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _showTimePicker,
              child: const Text('Pick a Time'),
            ),
          ],
        ),
      ),
    );
  }
}
```

For more customization options and advanced usage, refer to the [API documentation](#).

## License

This package is released under the [MIT License](LICENSE).
