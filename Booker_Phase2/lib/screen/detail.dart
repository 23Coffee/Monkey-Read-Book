import 'package:booker/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class DetailScreen extends StatefulWidget {
  static const String id = 'detail_screen';
  final Book book;

  DetailScreen({required this.book});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Book? _book;
  FlutterTts flutterTts = FlutterTts();
  bool _expanded = false;
  bool _isPlaying = false;
  final translator = GoogleTranslator();

  @override
  void initState() {
    super.initState();
    _book = widget.book;
  }

  @override
  void dispose() {
    // Make sure to stop the speech when the screen is disposed
    _stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Book Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _book?.imageUrl != null
                    ? Transform.scale(
                        scale: 1.0, // Reducing size by 50%
                        child: Image.network(
                          _book!.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Placeholder(),
              ),
              Text(
                'Title: ${_book?.title ?? 'Unknown'}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Author(s): ${_book?.author ?? 'Unknown'}'),
              SizedBox(height: 8.0),
              SizedBox(height: 16.0),
              Text(
                  'Description: ${_expanded ? _book?.description ?? 'No description available' : _truncateDescription(_book?.description)}'),
              if (!_expanded) SizedBox(height: 8.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _expanded = true;
                        _speak(_book?.description ?? '');
                        _isPlaying = true;
                      });
                    },
                    child: Icon(Icons.play_arrow,
                    color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  if (_isPlaying)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isPlaying = false;
                          _pause();
                        });
                      },
                      child: Icon(Icons.pause,
                      color: Colors.black,
                      ),
                    ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: _stop,
                    child: Icon(Icons.stop,
                    color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text('Page Count: ${_book?.pageCount ?? 'Unknown'}'),
              SizedBox(height: 8.0),
              Text('Categories: ${_book?.categories?.join(', ') ?? 'Unknown'}'),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  String description = _book?.description ?? '';
                  String translatedText =
                      await _translateToEnglish(description);
                  _speak(translatedText);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Translated Description'),
                        content: Text(translatedText),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _stop();
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Translate Description to English',
                style: TextStyle(
                            color: Colors.black,
                            ),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  String description = _book?.description ?? '';
                  String translatedText = await _translateToThai(description);
                  _speakthai(translatedText);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Translated Description',
                          style: TextStyle(
                            color: Colors.black,
                            ),
                          ),
                        content: Text(translatedText),
                        actions: [
                          TextButton(
                            onPressed: () {
                              
                              Navigator.of(context).pop();
                              _stop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Translate Description to Thai',
                style: TextStyle(
                            color: Colors.black,
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _truncateDescription(String? description) {
    if (description != null && description.length > 100) {
      return '${description.substring(0, 100)}...';
    }
    return description ?? 'No description available';
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.speak(text);
  }

  Future<void> _speakthai(String text) async {
    await flutterTts.setLanguage('th-TH');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  Future<void> _pause() async {
    await flutterTts.pause();
  }

  Future<void> _stop() async {
    await flutterTts.stop();
  }

  Future<String> _translateToEnglish(String text) async {
    Translation translation = await translator.translate(text, to: 'en');
    return translation.text ?? 'Translation failed';
  }

  Future<String> _translateToThai(String text) async {
    Translation translation =
        await translator.translate(text, from: 'en', to: 'th');
    return translation.text ?? 'Translation failed';
  }
}
