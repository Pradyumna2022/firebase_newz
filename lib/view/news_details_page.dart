import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsPage extends StatefulWidget {
  final String newsUrl;
  const NewsDetailsPage({super.key, required this.newsUrl});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  
  final controller = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadRequest(Uri.parse(widget.newsUrl));
    print('INIT STATE CALL AND URL IS + ${widget.newsUrl}');
  }
  @override
  Widget build(BuildContext context) {
    print(widget.newsUrl.toString() +"THIS IS URL OF THE PREV SCREEN (((((((((((((((((((((((");
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
