import 'package:evently/ui/auth/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginScreenViewModel extends ChangeNotifier{
  var emailController = TextEditingController(text: 'mostafa@email.com');
  var passWordController = TextEditingController(text: '123456');
  late LoginNavigator navigator;
  var formKey = GlobalKey<FormState>();
  void login()async{
    if(formKey.currentState?.validate()==true){
    navigator.showMyLoading('Wating....');
    // Proceed to login
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passWordController.text,
      );
      navigator.hideMyLoading();
       navigator.showMyMessage('Login sucsessfully');

    } on FirebaseAuthException catch (e) {
      navigator.hideMyLoading();
      navigator.showMyMessage('No user found for that email.');
      // DialogUtils.showMessage(
      //   context: context,
      //   message: 'No user found for that email.',
      //   title: 'Erorr',
      //   posActionName: 'OK',
      // );

      if (e.code == 'network-request-failed') {
        navigator.hideMyLoading();
        navigator.showMyMessage('Wrong password provided for that user.');

      } else if (e.code == 'invalid-credential') {
        navigator.hideMyLoading();
        navigator.showMyMessage('uncorrected credential');

      }
    } catch (e) {
      navigator.hideMyLoading();
      navigator.showMyMessage(e.toString());

    }
  }
}}