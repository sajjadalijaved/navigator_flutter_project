import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool ischeck = false;
  bool _obscure = true;
  late String _email;

  void _obscured() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _valid() {
    if (globalKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('correct validation')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('validation failled')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leadingWidth: 15,
          title: const Text('SignInForm'),
          leading: IconButton(
            tooltip: 'Move to back page',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0XFFF95A3B), Color(0XFFF96713)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 0.8],
              tileMode: TileMode.mirror),
        ),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(
                flex: 3,
              ),
              Expanded(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Spacer(
                        flex: 25,
                      ),
                      Expanded(
                        flex: 35,
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/sajjad.png')),
                      ),
                      Spacer(
                        flex: 40,
                      )
                    ],
                  )),
              Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Spacer(
                        flex: 25,
                      ),
                      Expanded(
                        flex: 60,
                        child: Text(
                          'YOUR APP NAME',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Spacer(
                        flex: 15,
                      )
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Spacer(
                        flex: 28,
                      ),
                      Expanded(
                        flex: 60,
                        child: Text(
                          'Company Slogon',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Spacer(
                        flex: 12,
                      )
                    ],
                  )),
              Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Spacer(
                        flex: 25,
                      ),
                      Expanded(
                        flex: 60,
                        child: Text(
                          'Email SignIn',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Spacer(
                        flex: 15,
                      )
                    ],
                  )),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 13,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 10,
                      ),
                      Expanded(
                        flex: 80,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            }
                            if (!RegExp(
                                    '^[a-zA-Z0-9.a-zA-Z0-9.!#%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                .hasMatch(value)) {
                              return 'Please Enter valid Email';
                            }
                            return null;
                          },
                          onSaved: (String? email) {
                            _email = email!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                          ),
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                            filled: true,
                            errorStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: 'User Email',
                            labelStyle: TextStyle(color: Colors.black),

                            // suffixIcon: Icon(Icons.close),
                            prefixIcon: Icon(
                              Icons.email_sharp,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 10,
                      )
                    ],
                  )),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 10,
                      ),
                      Expanded(
                        flex: 80,
                        child: TextFormField(
                          validator: (value) {
                            int counterAlpha = 0;
                            int counterNumber = 0;
                            int counterSymbol = 0;
                            if (value!.length >= 8) {
                              value.runes.forEach((int element) {
                                String char = String.fromCharCode(element);
                                if (char.contains(RegExp(r'[A-Z]')) ||
                                    char.contains(RegExp(r'[a-z]'))) {
                                  counterAlpha++;
                                } else if (char.contains(RegExp(r'[0-9]'))) {
                                  counterNumber++;
                                } else if (char.contains(
                                    RegExp(r'[@#!%^&*()=\|/?><-_$]'))) {
                                  counterSymbol++;
                                }
                              });
                              if (counterAlpha >= 2 &&
                                  counterNumber >= 2 &&
                                  counterSymbol >= 2) {
                                return null;
                              } else {
                                return 'Please enter stronge password';
                              }
                            }
                            return 'Password length should be greater or equal 8';
                          },
                          obscureText: _obscure,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                            filled: true,
                            errorStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: 'User Password',
                            labelStyle: const TextStyle(color: Colors.black),
                            suffixIcon: GestureDetector(
                              onTap: _obscured,
                              child: Icon(
                                  _obscure
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility,
                                  color: Colors.black),
                            ),
                            hintStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 10,
                      )
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 15,
                      ),
                      Expanded(
                          flex: 70,
                          child: ListTile(
                            leading: Checkbox(
                                activeColor: Colors.black,
                                hoverColor: Colors.green,
                                value: ischeck,
                                onChanged: (value) {
                                  setState(() {
                                    ischeck = !ischeck;
                                  });
                                }),
                            title: const Text(
                              'Remember me',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          )),
                      const Spacer(
                        flex: 15,
                      )
                    ],
                  )),
              const Spacer(
                flex: 7,
              ),
              Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 10,
                      ),
                      Expanded(
                        flex: 80,
                        child: Container(
                          // height: 70,
                          // width: 20,
                          decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: OutlinedButton(
                              onPressed: () {
                                _valid();
                              },
                              child: const Text('Get Start',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30))),
                        ),
                      ),
                      const Spacer(
                        flex: 10,
                      )
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Spacer(
                        flex: 40,
                      ),
                      Expanded(
                          flex: 55,
                          child: Text('Forget Password?',
                              style: TextStyle(color: Colors.white))),
                      Spacer(
                        flex: 5,
                      )
                    ],
                  )),
              const Spacer(
                flex: 7,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
