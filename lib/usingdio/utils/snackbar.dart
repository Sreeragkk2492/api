import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

showcustomsnackbar(context) {
  return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
          message: 'something went wrong please check your credentials'));
}
