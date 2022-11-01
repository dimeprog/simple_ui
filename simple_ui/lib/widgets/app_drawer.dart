import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ui/view_models/auth_controller.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 200,
      shape: RoundedRectangleBorder(),
      child: SafeArea(
        child: Container(
          width: 200,
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order",
                  style: TextStyle(
                      color: Color(0xff0C2D48),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(
                      color: Color(0xff0C2D48),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                      color: Color(0xff0C2D48),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const Text(
                      "Signout",
                      style: TextStyle(
                          color: Color(0xff0C2D48),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(authControllerProvider.notifier)
                              .signOut(context);
                        },
                        icon: const Icon(
                          Icons.exit_to_app_sharp,
                          color: Colors.red,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
