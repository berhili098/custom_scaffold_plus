import 'package:custom_scaffold_plus/custom_scaffold_plus.dart';
import 'package:flutter/material.dart';

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
  bool _useResponsiveLayout = true;

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Create scaffold content based on current configuration
    Widget scaffoldContent = CustomScaffoldPlus(
      appBar: AppBar(
        title: const Text('Custom Scaffold Plus'),
        actions: [
          IconButton(
            icon: Icon(_useResponsiveLayout ? Icons.devices : Icons.smartphone),
            onPressed: () {
              setState(() {
                _useResponsiveLayout = !_useResponsiveLayout;
              });
            },
            tooltip: 'Toggle Responsive Layout',
          ),
        ],
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
      // New features demonstration
      backgroundGradient: isDark
          ? const LinearGradient(
              colors: [Colors.blueGrey, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          : null,
      bodyAlignment: Alignment.center,
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInOutCubic,
      onRefresh: _onRefresh,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button $_count times',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() => _count++),
            child: const Text('Increment'),
          ),
        ],
      ),
    );

    // If responsive layout is enabled, wrap the scaffold in a ResponsiveLayout widget
    if (_useResponsiveLayout) {
      return ResponsiveLayout(
        mobile: scaffoldContent,
        tablet: CustomScaffoldPlus(
          appBar: AppBar(
            title: const Text('Tablet Layout'),
            actions: [
              IconButton(
                icon: Icon(Icons.portable_wifi_off),
                onPressed: () {
                  setState(() {
                    _useResponsiveLayout = !_useResponsiveLayout;
                  });
                },
                tooltip: 'Toggle Responsive Layout',
              ),
            ],
          ),
          scrolling: true,
          isDark: isDark,
          padding: const EdgeInsets.all(24),
          bodyAlignment: Alignment.center,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tablet Layout', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              Text(
                'Counter: $_count',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _count--),
                    child: const Text('Decrement'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => setState(() => _count++),
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ],
          ),
        ),
        desktop: CustomScaffoldPlus(
          appBar: AppBar(
            title: const Text('Desktop Layout'),
            actions: [
              IconButton(
                icon: const Icon(Icons.portable_wifi_off),
                onPressed: () {
                  setState(() {
                    _useResponsiveLayout = !_useResponsiveLayout;
                  });
                },
                tooltip: 'Toggle Responsive Layout',
              ),
            ],
          ),
          scrolling: false,
          isDark: isDark,
          padding: const EdgeInsets.all(32),
          bodyAlignment: Alignment.center,
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.menu, size: 48),
                        SizedBox(height: 16),
                        Text('Navigation', style: TextStyle(fontSize: 20)),
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.home), title: Text('Home')),
                        ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings')),
                        ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Profile')),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Desktop Layout',
                        style: TextStyle(fontSize: 32)),
                    const SizedBox(height: 30),
                    Text(
                      'Counter: $_count',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => setState(() => _count--),
                          icon: const Icon(Icons.remove),
                          label: const Text('Decrement'),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton.icon(
                          onPressed: () => setState(() => _count++),
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return scaffoldContent;
  }
}
