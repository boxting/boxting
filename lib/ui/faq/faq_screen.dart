import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Html(
          data: 'Hello',
        ),
      ),
    );
  }
}
