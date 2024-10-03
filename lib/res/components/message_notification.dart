import 'package:flutter/material.dart';


class MessageNotification extends StatelessWidget {
 final String title;
  const MessageNotification({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 194, 207, 227),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.notifications,color: Colors.black,),
        ), Text(title)],
      ),
    );
  }
}
