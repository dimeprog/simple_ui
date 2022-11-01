import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ui/screens/auth_checker_screen.dart';
import 'package:simple_ui/screens/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff3a48ed),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: SvgPicture.asset('assets/images/lode _asset.svg'),
                ),
              ),
            ),
            const Text(
              "Splash Food",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //   child: Center(
            //     child: Text(
            //       'The lorem ipsum gets its name from the Latin phrase \nNeque porro quisquam est qui dolorem ipsum quia dolor sit amet.\n which translates to “Nor is there anyone who loves or pursues or desires to obtain pain of itself,\n because it is pain.',
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 14),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AuthChecker()),
                          );
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              size: 32,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // )
  }
}
