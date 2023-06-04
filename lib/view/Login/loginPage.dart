import 'package:first_day/view/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../Chats/chatPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibility = true;

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Colors.amberAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.account_circle_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 100,
              // backgroundColor: Colors.amber,
              // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60'),
              backgroundImage: AssetImage("assets/images/03.png"),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Form(
              key: _fromKey,
              child: SizedBox(
                width: size.width * 0.6,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.orangeAccent),
                        ),
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibility = !visibility;
                                });
                              },
                              icon: const Icon(Icons.visibility)),
                          labelText: 'Password',
                          border: const OutlineInputBorder()),
                      obscureText: visibility,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      height: size.height * 0.04,
                      child: ElevatedButton(
                        onPressed: () {
                          // print(_emailController.value);
                          // print(_passwordController.value);
                          if (_fromKey.currentState!.validate()) {
                            print(_emailController.value.text);
                            print(_passwordController.value.text);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MainLayOut()));
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('Forget password'))),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('Register'))),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: size.height * 0.045,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onDoubleTap: () {
                          print('Double Tap');
                        },
                        onTap: () {
                          print('Tap');

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                        },
                        onHover: (val) {
                          print(val);
                        },
                        onLongPress: () {
                          print('Long Press');
                        },
                        child: const Center(
                            child: Text(
                          'Chat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
