import 'package:flutter/material.dart';

Widget CustomButton(String title, IconData icon, VoidCallback onTap,
    double screenWidth, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: screenWidth * 0.90 - 30,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 50),
            Icon(icon, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                title,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
