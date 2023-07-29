import 'package:json_utils/json_utils.dart';
import 'package:shelf_gcp_utils/shelf_gcp_utils.dart';
import 'package:test/test.dart';

void main() {
  test('can extract a pub/sub message from the body of a request', () {
    JsonMap json = extractPubSubMessage('a');

    expect(json['b'], 'c');
  });
}
