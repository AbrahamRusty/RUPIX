import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  HelpCenterScreenState createState() => HelpCenterScreenState();
}

class HelpCenterScreenState extends State<HelpCenterScreen> {
  final List<Item> _data = [
    Item(
      headerValue: 'Account & Registration',
      expandedValue:
          'This is the detailed answer for Account & Registration questions.',
    ),
    Item(
      headerValue: 'Transaction & Payments',
      expandedValue:
          'This is the detailed answer for Transaction & Payments questions.',
    ),
    Item(
      headerValue: 'Security',
      expandedValue: 'This is the detailed answer for Security questions.',
    ),
    Item(
      headerValue: 'Promotions & Rewards',
      expandedValue:
          'This is the detailed answer for Promotions & Rewards questions.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.purple[800],
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _data[index].isExpanded = !isExpanded;
                });
              },
              children: _data.map<ExpansionPanel>((Item item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(title: Text(item.headerValue));
                  },
                  body: ListTile(
                    title: Text(item.expandedValue),
                    subtitle: const Text('Ini adalah detail jawaban.'),
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.email, color: Colors.blue),
                      title: const Text('Email'),
                      subtitle: const Text('your.email@gmail.com'),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(
                        Icons.support_agent,
                        color: Colors.blue,
                      ),
                      title: const Text('Customer Service'),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });
  String headerValue;
  String expandedValue;
  bool isExpanded;
}
