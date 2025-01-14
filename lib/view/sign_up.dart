import 'package:animated_background/animated_background.dart';
import 'package:app/controller/sign_up_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignupState();
}

class _SignupState extends State<SignUp> with SingleTickerProviderStateMixin {
  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/wall.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                  baseColor: Colors.blue,
                  spawnMaxRadius: 40,
                  spawnMaxSpeed: 40,
                  spawnMinSpeed: 15,
                  particleCount: 60,
                  spawnOpacity: 0.1)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Hero(
                      tag: "logo",
                      child: SizedBox(
                        width: 300,
                        height: 250,
                        child: Lottie.asset(
                          'asset/splash_chat.json',
                          fit: BoxFit.cover,
                          repeat: true,
                          reverse: false,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "SIGNUP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    controller: _signupController.emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2)),
                      label: const Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.start,
                      controller: _signupController.passwordController,
                      obscureText: _signupController.hide.value,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2)),
                        prefixIcon: const Icon(
                          Icons.lock_open_outlined,
                          color: Colors.white,
                        ),
                        suffix: IconButton(
                            onPressed: () {
                              _signupController.hideFun();
                            },
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            )),
                        label: const Text(
                          "Password",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => _signupController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.blue,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _signupController.signupFun(context);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 100)),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        _signupController.gologin();
                      },
                      child: Text(
                        "Login your Account",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
