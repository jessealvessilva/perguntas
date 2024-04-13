import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

// main() {
//   runApp(new PerguntaApp());
// }
void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
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
  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, Object>> perguntas = [

    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]["respostas"] as List<String>
        : [];
    List<Widget> widgets =
        respostas.map((t) => Resposta(t, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
                  ...widgets,
                ],
              )
            : Resultado(),
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
