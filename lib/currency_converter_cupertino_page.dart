import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  late double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    final amount = double.tryParse(textEditingController.text);
    if (amount != null) {
      setState(() {
        result = amount * 600;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey2,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Currency Converter',
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: CupertinoColors.systemGrey2,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} Fc',
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              CupertinoTextField(
                controller: textEditingController,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please enter the amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                child: const Text(
                  'Convert',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
