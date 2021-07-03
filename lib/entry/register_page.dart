import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Noticeboard/provider/authenticationService.dart';

class MyRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpasswordController =
      new TextEditingController();
  final firstNameTextEditController = new TextEditingController();
  final lastNameTextEditController = new TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  String _errorMessage = '';

  void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 36.0, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$_errorMessage',
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocus,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(_firstNameFocus);
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.length < 8 &&
                            confirmpasswordController.text != value) {
                          return 'Password must be longer than 8 characters.';
                        }
                        return null;
                      },
                      autofocus: false,
                      obscureText: true,
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      focusNode: _passwordFocus,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocus);
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: true,
                      controller: confirmpasswordController,
                      focusNode: _confirmPasswordFocus,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (confirmpasswordController.text.length > 8 &&
                            passwordController.text != value) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          context.read<AuthenticationService>().signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                          Navigator.pop(context);
                        }
                      },
                      padding: EdgeInsets.all(12),
                      color: Colors.lightGreen,
                      child: Text('Sign Up'.toUpperCase(),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.zero,
                      child: FlatButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black54),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))
                ],
              ))),
    );
  }
}
