import 'package:crypto_bag/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];

  String? dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownValue,
            dropdownColor: Colors.pink,
            focusColor: Colors.blueGrey,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                  labelText: 'Coin Amount',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.pink),
            child: MaterialButton(
              onPressed: () async {
                await addCoin(dropdownValue, _amountController.text);
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
              ),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
