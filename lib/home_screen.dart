import 'package:epam_homeworks/selection_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _title = 'I am going to update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _title,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28.0,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectionScreen(),
                  ),
                );
                setState(() {
                  _title = 'YOU CHOSE ${result ?? 'NOTHING'}';
                });
              },
              child: const Text('Go to 2nd screen'),
            ),
          ],
        ),
      ),
    );
  }
}
