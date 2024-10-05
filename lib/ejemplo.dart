import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

class Ejemplo extends StatefulWidget {
  const Ejemplo({super.key});

  @override
  State<Ejemplo> createState() => _EjemploState();
}

class _EjemploState extends State<Ejemplo> {
  ///Variable que puede o no aceptar la asignación de null
  int? rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmojiFeedback(
                rating: rating,
                emojiPreset: handDrawnEmojiPreset,
                labelTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w400),
                onChanged: (value) {
                  setState(() => rating = value);
                  // Show snackbar
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(SnackBar(content: Text('$value')));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
