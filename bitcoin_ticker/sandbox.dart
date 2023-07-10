import 'dart:async';

main() {
  DateTime last = DateTime.now();
  Timer(Duration(milliseconds: 1239), () {
    print(last.difference(DateTime.now()).inMilliseconds);
  });
}
