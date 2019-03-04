library observable_builder;

import 'package:flutter/material.dart';

class ObservableBuilder<T> extends StatelessWidget {
  final Stream<T> observable;
  final Widget Function(BuildContext, T) onSuccess;
  final Widget Function(BuildContext, Object) onError;
  final Widget Function() onLoading;

  const ObservableBuilder({
    Key key,
    this.observable,
    this.onSuccess,
    this.onError,
    this.onLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: observable,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return onError(context, snapshot.error);
        else if (snapshot.hasData)
          return onSuccess(context, snapshot.data);
        else
          return onLoading();
      },
    );
  }
}

