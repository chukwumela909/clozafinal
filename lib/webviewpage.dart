import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Webviewpage extends StatefulWidget {
  const Webviewpage({Key? key}) : super(key: key);

  @override
  _WebviewpageState createState() => _WebviewpageState();
}

class _WebviewpageState extends State<Webviewpage> {
   late InAppWebViewController webViewController;
  DateTime? _lastPressedTime;

  Future<bool> _onWillPop() async {
    if (await webViewController.canGoBack()) {
      // If we can go back in webview history, do that
      webViewController.goBack();
      return false;
    }

    // Check if back button was pressed recently
    if (_lastPressedTime == null ||
        DateTime.now().difference(_lastPressedTime!) > Duration(seconds: 2)) {
      // First press or more than 2 seconds since last press
      _lastPressedTime = DateTime.now();

      // Show snackbar warning
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );

      return false;
    }

    // Second press within 2 seconds - exit the app
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: 
      WillPopScope(
        onWillPop: _onWillPop,
        child: InAppWebView(
          initialSettings: InAppWebViewSettings(
            javaScriptEnabled: true,
            allowUniversalAccessFromFileURLs:
                true, // Allows access to blob URLs
            allowFileAccess: true,
            domStorageEnabled: true,
          ),
          initialUrlRequest: URLRequest(
              url: WebUri.uri(Uri.parse("https://cloza.com.ng/"))),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onConsoleMessage: (controller, consoleMessage) {
            print("Console: ${consoleMessage.message}");
          },
          onDownloadStartRequest: (
            controller,
            downloadStartRequest,
          ) async {
          },
            
        ),
      ),
    ));
  }
}