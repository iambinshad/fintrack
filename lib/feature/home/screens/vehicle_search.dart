import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VehicleSearchingScreen extends StatefulWidget {
  const VehicleSearchingScreen({super.key});

  @override
  State<VehicleSearchingScreen> createState() => _VehicleSearchingScreenState();
}

class _VehicleSearchingScreenState extends State<VehicleSearchingScreen> {
  late stt.SpeechToText _speech;
  bool isListening = false;
  String _text = "Press the button and start speacking";
  double confidence = 1.0;
  @override
  void initState() {
    _speech = stt.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("confidenc: ${(confidence * 100.0).toStringAsFixed(1)}"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
          animate: isListening,
          glowColor: Theme.of(context).primaryColor,
          duration: const Duration(milliseconds: 2000),
          repeat: true,
          child: FloatingActionButton(
            onPressed: _listen,
            child: Icon(isListening ? Icons.mic : Icons.mic_none),
          )),
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          child: Text(
            _text,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    log("entered 1");
    if (!isListening) {
      log("entered 2");

      bool available = await _speech.initialize(
        debugLogging: true,
        // onStatus: (status) {
        //   log("Here also $status");

        //   if (status == "notListening") {
        //     log("Here also $status");
        //     setState(() {
        //       isListening = false;
        //     });
        //   }
        // },
        // onError: (status) => print('onError: $status'),
      );
      log("entered 3");

      if (available) {
        log("entered 4");
        isListening = true;

        setState(() {});
        log("entered 5");

        await _speech.listen(
          onResult: (result) {
            log(result.toString());
            setState(() {

              _text = result.recognizedWords;
              if (result.hasConfidenceRating && result.confidence > 0) {
                confidence = result.confidence;
              }
              if (result.finalResult && result.recognizedWords.isEmpty) {
                setState(() {
                  isListening = false;
                });
              }
              if (!_speech.isListening&&!_speech.isBlank!) {
                setState(() {
                  isListening = false;
                });
              }

            });
          },
        );

      }
    } else {
      setState(() {
        isListening = false;
        _speech.stop();
      });
    }
  }
}
