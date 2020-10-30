import 'package:flutter/material.dart';

class Observer<T> extends StatelessWidget {
  final Stream<T> stream;
  final Function builder;
  final Function onErrorBuilder;

  Observer({@required this.stream, this.builder, this.onErrorBuilder});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onErrorBuilder(context, snapshot.error);
        }

        if (snapshot.hasData) {
          T data = snapshot.data;
          return builder(context, data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
