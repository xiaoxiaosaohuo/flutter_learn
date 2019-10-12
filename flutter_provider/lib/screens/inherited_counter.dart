import 'package:flutter/material.dart';

class InheritedCounter extends StatelessWidget {
  static String routeName = '/provider/InheritedCounter';
  
  const InheritedCounter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('inherited_counter'),
        ),
        body: CounterWidget(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    final inherited =
                        context.inheritFromWidgetOfExactType(_InheritedCount)
                            as _InheritedCount;
                    return Text('${inherited.state.count}');
                  },
                ),
                Builder(
                  builder: (context) {
                    final ancestor =
                        context.ancestorWidgetOfExactType(_InheritedCount)
                            as _InheritedCount;
                    return RaisedButton(
                      onPressed: () => ancestor.state.incrementCount(),
                      child: Text('increment'),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, @required this.child}) : super(key: key);

  final Widget child;

  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count;

  void incrementCount() {
    setState(() {
      ++count;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCount(
      state: this,
      child: widget.child,
    );
  }
}

class _InheritedCount extends InheritedWidget {
  _InheritedCount({Key key, @required this.state, @required Widget child})
      : super(key: key, child: child);

  final _CounterWidgetState state;
  @override
  bool updateShouldNotify(_InheritedCount old) => true;
}
