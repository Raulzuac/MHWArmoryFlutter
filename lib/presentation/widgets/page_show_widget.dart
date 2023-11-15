import 'package:flutter/material.dart';

class PageShowWidget extends StatelessWidget {
  const PageShowWidget({
    super.key,
    required this.selected
  });
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: selected==1?20:5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: Colors.grey),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: selected==2?20:5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: Colors.grey),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: selected==3?20:5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: Colors.grey),
          ),
        ],
      ),
    );
  }
}