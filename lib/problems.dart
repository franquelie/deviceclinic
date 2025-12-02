import 'package:flutter/material.dart';

class DeviceProblemView extends StatefulWidget {
  const DeviceProblemView({super.key, this.problems});

  final List<String>? problems;

  @override
  State<DeviceProblemView> createState() => _DeviceProblemViewState();
}

class _DeviceProblemViewState extends State<DeviceProblemView> {
  final Set<String> _selectedProblems = {};

  late final List<String> _problems;

  @override
  void initState() {
    super.initState();
    _problems = widget.problems ?? [
      'Cannot Charge',
      'Cannot Power On',
      'Battery Drain Fast',
      'Auto Shutdown',
      'Keyboard Key Missing',
      'Cannot Connect Wifi',
      'Screen Flickering',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('deviceclinic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Device Problem',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
              'You may select more than one issue',
              style: TextStyle(fontSize: 14.0),
              ),
            ),
            Expanded(
              child: ListView(
                children: _problems.map((p) {
                  final checked = _selectedProblems.contains(p);
                  return CheckboxListTile(
                    title: Text(p),
                    value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedProblems.add(p);
                        } else {
                          _selectedProblems.remove(p);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _selectedProblems.isEmpty
                  ? null
                  : () {
                      Navigator.of(context).pop(_selectedProblems.toList());
                    },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
