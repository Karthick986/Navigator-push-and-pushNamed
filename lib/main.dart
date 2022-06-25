import 'package:flutter/material.dart';
import 'package:navigate_route/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Routes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SecondPage.routeName: (context) => const SecondPage(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cityName = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Routes'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Navigator push",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    cityName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      cityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondPage(
                                    cityName: 'Hyderabad',
                                  )));
                      setState(() {});
                    },
                    child: const Text("Push"),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              const Text("Navigator pushNamed",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(cityName, style: const TextStyle(fontSize: 20)),
                  MaterialButton(
                    onPressed: () async {
                      cityName = await Navigator.pushNamed(
                              context, '/secondPage', arguments: 'Hyderabad')
                          as String;
                      setState(() {});
                    },
                    child: const Text("Push Named"),
                    color: Colors.blueAccent,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
