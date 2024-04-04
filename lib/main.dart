import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final pergunta = [
      "Qual a sua cor favorita ?",
      "Qual o seu animal favorito ?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(pergunta[0]),
            const ElevatedButton(
              onPressed: null,
              child: Text('Resposta 1'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Resposta 2'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
