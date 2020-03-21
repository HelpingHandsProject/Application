import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helping_hands/Constants/colors.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BackgroundColor,
      child: Center(
        child: SpinKitChasingDots(
          color: LoadingSymbolColor,
          size: 50.0,
        ),
      ),
    );
  }
}