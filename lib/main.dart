import 'package:flutter/material.dart';
import 'package:pam_flutter/pam.dart';
import 'package:pam_uage/pam_config.dart';
import 'package:pam_uage/pam_utils.dart';
import 'package:pam_uage/sample_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pamConfig = PamConfigProvider.getConfig();
  await Pam.initialize(pamConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pam Flutter Usage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pamUtils = PamUtils();

  Future<void> _logIn() async {
    await pamUtils.pamLogIn(SampleConstants.sampleEmail);
  }

  Future<void> _trackHomePageView() async {
    await pamUtils.trackHomePageView(
      SampleConstants.sampleEmail,
      SampleConstants.sampleEmail,
      SampleConstants.sampleMobileNumber,
      DateTime.now().toIso8601String(),
      SampleConstants.sampleEventName,
    );
  }

  void _logOut() {
    pamUtils.pamLogOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              icon: Icons.login,
              label: 'Log in',
              onPressed: _logIn,
            ),
            _buildActionButton(
              icon: Icons.track_changes,
              label: 'Track Home Page View',
              onPressed: _trackHomePageView,
            ),
            _buildActionButton(
              icon: Icons.logout,
              label: 'Log out',
              onPressed: _logOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
