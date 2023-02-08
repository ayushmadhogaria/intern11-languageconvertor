import 'package:flutter/material.dart';
import 'package:intern11/data/app_style.dart';
import 'package:intern11/data/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordConverter extends StatelessWidget {
  const WordConverter({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    LanguageProvider wordConverter({required bool renderPage}) =>
        Provider.of<LanguageProvider>(context, listen: renderPage);

    String? selectedData = wordConverter(renderPage: true).selectedItem;

    List<String> items = ["नेपाली", "English"];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 28,
        ),
        title: Text(
          loc!.titleText,
          style: AppStyle.appBarTitle,
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                )),
                child: DropdownButton<String>(
                  iconSize: 0.0,
                  underline: const SizedBox(),
                  dropdownColor: Colors.grey,
                  borderRadius: BorderRadius.circular(25.0),
                  hint: Text('Select Language', style: AppStyle.dropDownData),
                  value: wordConverter(renderPage: true).selectedItem,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppStyle.dropDownBox,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      wordConverter(renderPage: false).setLocale(lang: value);
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedData != null)
                  MaterialButton(
                    color: Colors.black,
                    elevation: 5.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      loc.button,
                      style: AppStyle.buttonTextStyle,
                    ),
                    onPressed: () {
                      wordConverter(renderPage: false).clearMenu();
                    },
                  ),
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            if (selectedData != null)
              Text(
                loc.text,
                style: AppStyle.outputResult,
              ),
          ],
        ),
      ),
    );
  }
}
