import 'package:flutter/material.dart'; // Import flutter material
import 'package:webview_flutter/webview_flutter.dart';

class EmailWebView extends StatefulWidget {
  final String recipient; //Recipient email

  const EmailWebView({Key? key, required this.recipient}) : super(key: key);

  @override
  State<EmailWebView> createState() => _EmailWebViewState();
}

class _EmailWebViewState extends State<EmailWebView> {
  // WebViewController? _webViewController; // nullable webview controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose Email'),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode
              .unrestricted) //Enable Javascript  (usually needed for these services)
          ..setBackgroundColor(
              const Color(0x00000000)) //Transparent background.
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Useful if you want to show a loading indicator
                debugPrint('WebView is loading (progress: $progress%)');
              },
              onPageStarted: (String url) {
                debugPrint('Page started loading: $url');
              },
              onPageFinished: (String url) {
                debugPrint('Page finished loading: $url');
              },
              onWebResourceError: (WebResourceError error) {
                debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
              },
              onNavigationRequest: (NavigationRequest request) {
                // You can control which URLs the WebView can navigate to here
                debugPrint('allowing navigation to ${request.url}');
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(
              'https://mail.google.com/mail/?view=cm&fs=1&to=${widget.recipient}')),
      ), //Load gmail compose.  Modify for other services.
    );
  }
}


// HOW TO USE:

// Inside some widget to launch the email:
// ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => EmailWebView(recipient: 'test@example.com')),
//         );
//      },
//     child: const Text('Open Email in WebView'),
// )