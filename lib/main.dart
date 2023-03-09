import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realmproject/aes_encryption.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'AES',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  String url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: _textEditingController,
          ),
          TextFormField(
            controller: _textEditingController1,
          ),
          TextButton(
              onPressed: () {
                AesEncryption aes = AesEncryption();
                setState(() {
                  url =
                      "https://princeagarwal920.000webhostapp.com/prince_aes.php?userid=${aes.encryptedData(_textEditingController.text)}&password=${aes.encryptedData(_textEditingController1.text)}";
                });
              },
              child: const Text("SUBMIT")),
          InkWell(
            child: Text(url),
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: url)).then((value) => {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("copied to clipboard")))
                  });
            },
          ),
        ],
      ),
    );
  }
}

// void main() async {
//   RealmOperations realmOperations = RealmOperations();
//   await realmOperations.init();
//
//   runApp(MyApp(realmOperations: realmOperations));
// }
//
// class MyApp extends StatelessWidget {
//   final RealmOperations realmOperations;
//   const MyApp({super.key, required this.realmOperations});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(
//         title: 'Flutter Demo Home Page',
//         realmOperations: realmOperations,
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final RealmOperations realmOperations;
//
//   const MyHomePage({super.key, required this.title, required this.realmOperations});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   Widget actionButton({required String actionName, required Function() onPressed}) {
//     return TextButton(onPressed: onPressed, child: Text(actionName));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: [
//             actionButton(
//                 actionName: "Add Customer",
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) =>
//                           AddCustomerScreen(realmOperations: widget.realmOperations)));
//                 }),
//             actionButton(
//                 actionName: "Show Customer",
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) =>
//                           CustomerListScreen(realmOperations: widget.realmOperations)));
//                 }),
//
//             actionButton(
//                 actionName: "Large Json Data",
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => ActorList(widget.realmOperations.realm)));
//                 }),
//             // actionButton(
//             //     actionName: "Delete Customer",
//             //     onPressed: () {
//             //       Navigator.of(context).push(MaterialPageRoute(
//             //           builder: (context) =>
//             //               CustomerListScreen(realmOperations: widget.realmOperations)));
//             //     }),
//           ],
//         ));
//   }
// }
