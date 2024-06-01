import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/languageProvider.dart';

showSingleChoiceDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      var singleNotifier = Provider.of<SingleNotifier>(context);
      return AlertDialog(
          title: Text("Select Survery Language"),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: languages
                    .map(
                      (e) => RadioListTile(
                        title: Text(e),
                        value: e,
                        groupValue: singleNotifier.currentlanguage,
                        selected: singleNotifier.currentlanguage == e,
                        onChanged: (value) {
                          if (value != singleNotifier.currentlanguage) {
                            singleNotifier.updatelanguage(value);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ));
    });
