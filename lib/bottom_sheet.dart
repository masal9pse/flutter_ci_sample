import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),        
      onGenerateRoute: (settings) {
        return MaterialWithModalsPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('modal root'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // showBottomModalDialog(context: context, children: children);
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SampleModal();
                    },
                  );                  
                },
                child: const Text('go to modal'))
          ],
        ),
      ),
    );
  }
}

int count = 1;

class SampleModal extends StatelessWidget {
  const SampleModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$count'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // showBottomModalDialog(context: context, children: children);
                  count++;
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SampleModal();
                    },
                  );                  
                },
                child: const Text('go to modal'))
          ],
        ),
      ),
    );
  }
}
