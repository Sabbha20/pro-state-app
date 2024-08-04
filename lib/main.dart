import 'package:flutter/material.dart';
import 'package:pro_state_app/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Counter App - Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<AppProvider>(
                builder: (context, provider, child) => Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: Provider.of<AppProvider>(context, listen: false)
                        .decrementCounter,
                    child: const Icon(Icons.exposure_minus_1_outlined),
                  ),
                  ElevatedButton(
                    onPressed: Provider.of<AppProvider>(context, listen: false)
                        .incrementCounter,
                    child: const Icon(Icons.plus_one_outlined),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
