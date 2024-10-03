import 'package:flutter/material.dart';

class CommentSheetDemo extends StatefulWidget {
  @override
  _CommentSheetDemoState createState() => _CommentSheetDemoState();
}

class _CommentSheetDemoState extends State<CommentSheetDemo> {
  final List<String> _comments = [];
  final TextEditingController _controller = TextEditingController();

  void _addComment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _comments.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_comments[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addComment,
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ],
      
    );
  }
}