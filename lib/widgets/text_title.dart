import 'package:flutter/material.dart';

Widget titleText(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12, top: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
        ),
        const Row(
          children: [
            Text(
              "See all ",
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ],
    ),
  );
}