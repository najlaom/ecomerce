import 'package:flutter/material.dart';

class Aide extends StatefulWidget {
  const Aide({
    Key key,
  }) : super(key: key);
  @override
  _AideState createState() => _AideState();
}

class _AideState extends State<Aide> {
  bool loading = true;

  void _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: loading
            ? CircularProgressIndicator()
            : Text(
                '4',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
      ),
    );
  }
}
