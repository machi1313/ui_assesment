import 'package:flutter/material.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistic Screen')),
      body: const Center(child: Text('Welcome to the Statistic Screen!')),
    ) ;
  }
}