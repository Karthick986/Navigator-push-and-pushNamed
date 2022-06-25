import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const routeName = '/secondPage';

  final String? cityName;

  const SecondPage({Key? key, this.cityName}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Navigator pop (pushed)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.cityName.toString(),
                    style: const TextStyle(fontSize: 20)),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nagpur');
                  },
                  color: Colors.blueAccent,
                  child: const Text("Pop"),
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const Text(
              "Navigator pop (pushNamed)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(args.toString(), style: const TextStyle(fontSize: 20)),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nagpur');
                  },
                  color: Colors.blueAccent,
                  child: const Text("Pop"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
