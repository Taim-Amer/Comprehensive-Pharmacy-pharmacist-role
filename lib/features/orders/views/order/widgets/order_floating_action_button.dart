import 'package:flutter/material.dart';

class OrderFloatingActionButton extends StatelessWidget {
  const OrderFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      child: const Icon(Icons.add, size: 30,),
    );
  }
}
