import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ErrorBlock extends StatelessWidget {
  final bool showIcon;
  final String errorMessage;
  final void Function() onTryAgain;

  const ErrorBlock({
    Key key,
    this.errorMessage,
    this.showIcon = true,
    this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showIcon)
          Icon(
            FontAwesomeIcons.exclamationCircle,
            size: MediaQuery.of(context).size.width / 3,
          ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        if (onTryAgain != null)
          Padding(
            padding: const EdgeInsets.all(24),
            child: OutlineButton(
              padding: EdgeInsets.all(12),
              child: Text('Try again'),
              onPressed: onTryAgain,
            ),
          ),
      ],
    );
  }
}
