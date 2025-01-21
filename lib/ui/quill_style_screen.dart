import 'package:flutter/material.dart';

class QuillStyleScreen extends StatefulWidget {
  const QuillStyleScreen({super.key});

  @override
  State<QuillStyleScreen> createState() => _QuillStyleScreenState();
}

class _QuillStyleScreenState extends State<QuillStyleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Quill Style')),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
