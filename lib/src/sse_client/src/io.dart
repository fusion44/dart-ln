import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Stream<String>> establishSSEConnection(
  String url,
  String token,
) async {
  final http.Client _client = http.Client();
  StreamController<String> streamController = StreamController();
  var request = http.Request('GET', Uri.parse(url));

  request.headers['Cache-Control'] = 'no-cache';
  request.headers['Accept'] = 'text/event-stream';
  request.headers['X-Access'] = token;
  http.StreamedResponse response = await _client.send(request);
  response.stream
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())
      .listen((dataLine) {
    streamController.add(dataLine.trim());
  });

  return streamController.stream.asBroadcastStream();
}
