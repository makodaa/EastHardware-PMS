import 'package:flutter/widgets.dart';

mixin ProductFormValidator on Widget {
  String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter the product name.";
    }
    return null;
  }
}
