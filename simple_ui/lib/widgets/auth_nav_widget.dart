import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthBottomNavWidget extends ConsumerWidget {
  final String buttonOption;
  final String titleOption;
  final onPress;
  const AuthBottomNavWidget(
      {super.key,
      required this.onPress,
      required this.buttonOption,
      required this.titleOption});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(children: [
      Text(
        titleOption,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      TextButton(
        onPressed: onPress,
        child: Text(
          buttonOption,
          style: const TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )
    ]);
  }
}
