import 'package:flutter/material.dart';

class UserChatBubble extends StatelessWidget {
  final String text;

  const UserChatBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 60, right: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20).copyWith(
            bottomRight: const Radius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87, fontSize: 15),
        ),
      ),
    );
  }
}