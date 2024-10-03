import 'package:flutter/material.dart';
import 'package:meettown/res/components/message_notification.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return MessageNotification(title: 'Profile visited by someone');
      },
    );
  }
}