import 'package:cure/signalr.dart';
import 'package:test/test.dart';

void main() {
  group('# Aborted', () {
    test('# Is false on initialization', () {
      final controller = AbortController();
      final signal = controller.signal;
      expect(signal.aborted, false);
    });
    test('# Is true when aborted', () {
      final controller = AbortController();
      final signal = controller.signal;
      controller.abort();
      expect(signal.aborted, true);
    });
  });
  group('# OnAbort', () {
    test('# Is called when abort is called', () {
      final controller = AbortController();
      final signal = controller.signal;
      var abortCalled = false;
      signal.onabort = () => abortCalled = true;
      controller.abort();
      expect(abortCalled, true);
    });
  });
}
