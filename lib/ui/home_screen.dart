import 'package:epam_homeworks/ui/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late var _title = AppLocalizations.of(context)?.before_text_changed ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.app_name ?? ''),
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
                  _title =
                      '${AppLocalizations.of(context)?.after_text_changed} ${result ?? AppLocalizations.of(context)?.nothing}';
                });
              },
              child:
                  Text(AppLocalizations.of(context)?.next_button_label ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
