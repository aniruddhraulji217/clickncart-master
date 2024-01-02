



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<String>  signUpUsers(
      String email,
      String fullName,
      String phoneNumber,
      String password) async {
        String res = 'Some error occured';
        try{
          if(email.isNotEmpty &&
              fullName.isNotEmpty &&
              phoneNumber.isNotEmpty &&
              password.isNotEmpty) {

            UserCredential cred = await  _auth.createUserWithEmailAndPassword(
              email: email, password: password
            );
            await _firestore.collection('buyers').doc(cred.user!.uid).set({
                    'email': email,
                    'fullName': fullName,
                    'phoneNumber': phoneNumber,
                    'buyerId': cred.user!.uid,
                    'address': ' ',
            });

            res = 'success';
          }else{
            res = ' Please Fields must not be empty';
          }
        }
        catch(e) {
        }
        return res;
  }

  loginUsers(String email, String password) async {
      String res = 'Error Occurred';

      try {
          if (email.isNotEmpty && password.isNotEmpty) {
                await _auth.signInWithEmailAndPassword(email: email, password: password);

                res = 'success';
          } else {
                res = 'Fields must not be empty';
          }
      } catch (e) {
        res = e.toString();
      }
          return res;
  }
  Future<String?> getUserFullName() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        return user.displayName;
      }
      return null;
    } catch (e) {
      print('Error retrieving user full name: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }


  Future<String?> getUserPhoneNumber() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // You may need to adjust the way you store the user's phone number in Firebase
        // For example, if you store it in the phoneNumber field, you can use user.phoneNumber
        return user.phoneNumber;
      }
      return null;
    } catch (e) {
      print('Error retrieving user phone number: $e');
      return null;
    }
  }



}