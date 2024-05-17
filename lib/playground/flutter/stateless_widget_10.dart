import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Plattform-Demo';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyPlatformWidget(),
      ),
    );
  }
}

class MyPlatformWidget extends StatelessWidget {
  const MyPlatformWidget({Key? key}) : super(key: key);

  bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  bool get isDesktopDevice => !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isFuchsia => !kIsWeb && Platform.isFuchsia;
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isLinux => !kIsWeb && Platform.isLinux;
  bool get isMacOS => !kIsWeb && Platform.isMacOS;
  bool get isWindows => !kIsWeb && Platform.isWindows;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'isMobileDeviceOrWeb: $isMobileDeviceOrWeb',
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        Text(
          'isDesktopDeviceOrWeb: $isDesktopDeviceOrWeb',
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ],
    );
  }
}
