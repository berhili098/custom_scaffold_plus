import 'package:flutter/material.dart';

import 'package:custom_scaffold_plus/custom_scaffold_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Scaffold Example',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomScaffoldPlus(
      appBar: AppBar(
        title: const Text('Custom Scaffold Plus'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Navigation')),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Settings')),
          ],
        ),
      ),
      scrolling: true,
      isDark: isDark,
      darkBackgroundAsset: 'assets/bg_dark.jpg',
      lightBackgroundAsset: 'assets/bg_light.jpg',
      padding: const EdgeInsets.all(16),
      onRefresh: _onRefresh,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pull to refresh or press the + button',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Text('You’ve refreshed $_count times.'),
          const SizedBox(height: 400), // make it scrollable
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Bottom Navigation',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
