import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationShoppingBag extends StatelessWidget {
  const NotificationShoppingBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Center(
        child: Stack(
          children: const [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white70,
              size: 50,
            ),
            Positioned(
                top: 30,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10,
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
