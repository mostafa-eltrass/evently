import 'package:evently/ui/auth/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
class RegisterScreenViewModel extends ChangeNotifier{
   late RegisterNavigator navigator;
  void register(String email , String password) async{
    // Proceed to register
    navigator.showMyLoaging('Loading');
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password ,
      );
      navigator.hideMyLoading();
      navigator.showMyMessage('Register sucsessfully');
    } on FirebaseAuthException catch (e) {
      navigator.hideMyLoading();
      navigator.showMyMessage('The password provided is too weak.');
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        navigator.hideMyLoading();
        navigator.showMyMessage('The account already exists for that email. ');

      } else if (e.code == 'network-request-failed') {
        navigator.hideMyLoading();
        navigator.showMyMessage('Wrong password provided for that user.');
      }
    } catch (e) {
      navigator.hideMyLoading();
       navigator.showMyMessage(e.toString());
    }
  }
  }
