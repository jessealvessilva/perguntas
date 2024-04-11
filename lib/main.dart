import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questao.dart';
import './resposta.dart';

// main() {
//   runApp(new PerguntaApp());
// }
void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    print("Clicou agora...");
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, Object>> perguntas = [
    final perguntas = [
      {
        "texto": "Qual é a sua cor favorita?",
        "respostas": ["Preto", "Vermelho", "Verde", "Branco"]
      },
      {
        "texto": "Qual é o seu animal favorito?",
        "respostas": ["Coelho", "Cobra", "Elefante", "Leão"]
      },
      {
        "texto": "Qual é o seu instrutor favorito?",
        "respostas": ["Maria", "João", "Leo", "Pedro"]
      }
    ];

    List<Widget> respostas = [];

    for (String textoResp
        in perguntas[_perguntaSelecionada]["respostas"] as List) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao((perguntas[_perguntaSelecionada]["texto"]) as String),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
