import 'package:chmod_calculator/chmod_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chmod Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chmod Calculator - Adam Elaoumari'),
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
  ChmodModel _chmodModel = ChmodModel();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Please input the chmod string"),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Chmod',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _chmodModel = ChmodModel();
                _chmodModel!.fromString(_controller.text);
                if (_chmodModel.toNumber() != 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Chmod Number'),
                        content: Text(
                            'The chmod number is: ${_chmodModel!.toNumber()}'),
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Invalid chmod string'),
                      );
                    },
                  );
                }
                setState(() {});
              },
              child: const Text('Convert to number'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Owner"),
                    Checkbox(
                      value: _chmodModel?.ownerRead,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.ownerRead = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                    Checkbox(
                      value: _chmodModel?.ownerWrite,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.ownerWrite = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                    Checkbox(
                      value: _chmodModel?.ownerExecute,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.ownerExecute = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("Group"),
                    Checkbox(
                      value: _chmodModel?.groupRead,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.groupRead = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                    Checkbox(
                      value: _chmodModel?.groupWrite,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.groupWrite = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                    Checkbox(
                      value: _chmodModel?.groupExecute,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.groupExecute = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("Others"),
                    Checkbox(
                      value: _chmodModel?.othersRead,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.othersRead = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                    Checkbox(
                      value: _chmodModel?.othersWrite,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.othersWrite = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                    Checkbox(
                      value: _chmodModel?.othersExecute,
                      onChanged: (value) {
                        setState(() {
                          _chmodModel!.othersExecute = value!;
                          _controller.text = _chmodModel!.toString();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
