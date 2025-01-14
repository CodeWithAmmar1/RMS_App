import 'package:animated_background/animated_background.dart';
import 'package:app/controller/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final LoginController _loginController = Get.put(LoginController());
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
                    "LOGIN",
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
                    controller: _loginController.text,
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
                      controller: _loginController.pass,
                      obscureText: _loginController.hide.value,
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
                              _loginController.hideFun();
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
                    () => _loginController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.blue,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _loginController.loginFun(context);
                            },
                            child: const Text(
                              "login",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Did not have account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            _loginController.gosignup();
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
