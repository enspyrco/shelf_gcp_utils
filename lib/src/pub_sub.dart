import 'dart:convert';

import 'package:json_utils/json_utils.dart';

JsonMap extractPubSubMessage(String bodyString) {
  final JsonMap bodyJson = jsonDecode(bodyString);

  final JsonMap messageJson = bodyJson['message'] as JsonMap? ??
      (throw MalformedJsonException(
          'The "message" key was not found at the top level', bodyJson));

  final String encodedMessageData = messageJson['data'] as String? ??
      (throw MalformedJsonException(
          '"data" key was not found in "message" object', bodyJson));

  final JsonMap decodedMessageJson =
      json.decode(utf8.decode(base64.decode(encodedMessageData))) as JsonMap;

  return decodedMessageJson;
}
