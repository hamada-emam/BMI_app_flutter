import 'package:bmi/app/homebage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordVisapility = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "The Way",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email name must not be empty';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  obscureText: passwordVisapility,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password name must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisapility == false
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisapility == false
                                ? passwordVisapility = true
                                : passwordVisapility = false;
                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 60,
                ),
                Builder(
                  builder: (ctx) {
                    return SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            SharedPreferences _pref =
                                await SharedPreferences.getInstance();
                            _pref.setString(
                                "email", _emailController.toString());
                            _pref.setString(
                                "pass", _passwordController.toString());
                            Navigator.of(ctx).pushReplacement(MaterialPageRoute(
                                builder: (_) => const MyApp()));
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text("don't have an Account?"),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Register now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
