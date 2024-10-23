import 'package:flutter/material.dart';

class CountrySelectScreen extends StatefulWidget {
  const CountrySelectScreen({super.key});

  @override
  State<CountrySelectScreen> createState() => _CountrySelectScreenState();
}

class _CountrySelectScreenState extends State<CountrySelectScreen> {
  List<CountryData> country = [
    CountryData(name: "India", code: "+91", flag: "🇮🇳"),
    CountryData(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryData(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryData(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryData(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryData(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryData(name: "Italy", code: "+39", flag: "🇮🇹"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('Choose a Country',
            style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                wordSpacing: 1,
                fontWeight: FontWeight.w600)),
      ),
      body: ListView.builder(
          itemCount: country.length,
          itemBuilder: (context, index) => card(country[index])),
    );
  }

  Widget card(CountryData c) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, c);
      },
      child: Card(
        margin: const EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(c.flag),
              const SizedBox(
                width: 20,
              ),
              Text(c.name),
              Expanded(
                child: SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(c.code),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryData {
  String name;
  String code;
  String flag;

  CountryData({required this.name, required this.code, required this.flag});
}
