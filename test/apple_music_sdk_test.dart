import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apple_music_sdk/apple_music_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('apple_music_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AppleMusicSdk.platformVersion, '42');
  });
}
