import 'package:flutter/material.dart';

class PlanRow extends StatelessWidget {
  final Map mObj;
  final bool isSelect;
  final VoidCallback onPressed;
  const PlanRow(
      {super.key,
      required this.mObj,
      this.isSelect = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset(
              mObj['icon'],
              width: 35,
              height: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                mObj["name"],
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
