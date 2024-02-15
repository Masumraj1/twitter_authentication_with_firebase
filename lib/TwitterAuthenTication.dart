import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterAuThenTication extends StatelessWidget {
  const TwitterAuThenTication({super.key});



  @override
  Widget build(BuildContext context) {
    // print("===================================$signInWithTwitter()");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twitter"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed:signInWithTwitter, child: const Text("Twitter login")),
      ),
    );
  }
  void signInWithTwitter() async {

   try {
     // Create a TwitterLogin instance
     final twitterLogin =  TwitterLogin(
         apiKey: 'GqG0rTf6BQrCg7hfYD15lbMC4',
         apiSecretKey: 'uJR7W4udV2YCkptTOUW3MeiG4NduY0Yg91pOL2t9EJD57kfYhf',
         redirectURI: 'twitter-authentication://'
     );
     // Trigger the sign-in flow
     await twitterLogin.login().then((value) async {
       final twitterAuthCredential = TwitterAuthProvider.credential(
         accessToken: value.authToken!,
         secret: value.authTokenSecret!,
       );

       await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

       print("-----------------------------${value.authToken}");
       print("-----------------------------${value.authTokenSecret}");
       print("-----------------------------${value.user}");
       print("-----------------------------${value.errorMessage}");
     });
   }catch (e){
     print("==========================This is Error ============================$e");
   }
  }

//   //
//   // void login() async {
//   //   try {
//   //     final twitterLogin = TwitterLogin(
//   //         apiKey: 'GqG0rTf6BQrCg7hfYD15lbMC4',
//   //         apiSecretKey: 'uJR7W4udV2YCkptTOUW3MeiG4NduY0Yg91pOL2t9EJD57kfYhf',
//   //         redirectURI: 'https://twitter-cb862.firebaseapp.com/__/auth/handler://');
//   //
//   //     await twitterLogin.login().then((value) async {
//   //       final authToken = value.authToken;
//   //       final authTokenSecret = value.authTokenSecret;
//   //       if (authToken != null && authTokenSecret != null) {
//   //         final twitterAuthCredentials = TwitterAuthProvider.credential(
//   //             accessToken: authToken, secret: authTokenSecret);
//   //         await FirebaseAuth.instance.signInWithCredential(
//   //             twitterAuthCredentials);
//   //       }
//   //     }
//   //
//   //     );
//   //   }catch (e){
//   //     print("===========================This is error==================$e");
//   //   }
//   // }
//
//
//   void login() async {
//     try {
//       final twitterLogin = TwitterLogin(
//           apiKey: 'GqG0rTf6BQrCg7hfYD15lbMC4',
//           apiSecretKey: 'uJR7W4udV2YCkptTOUW3MeiG4NduY0Yg91pOL2t9EJD57kfYhf',
//           redirectURI: 'twitter-authentication://');
//
//       await twitterLogin.login().then((value) async {
//         final authToken =await value.authToken;
//         final authTokenSecret = value.authTokenSecret;
//         if (authToken != null && authTokenSecret != null) {
//           final twitterAuthCredentials = TwitterAuthProvider.credential(
//               accessToken: authToken, secret: authTokenSecret);
//           await FirebaseAuth.instance.signInWithCredential(
//               twitterAuthCredentials);
//
//           print("---------------------------------$twitterAuthCredentials");
//           print("---------------------------------${value.user}---------------}");
//         }
//       });
//     }catch (e){
//       print("=======================================================================This is big error $e");
//     }
//   }
}
