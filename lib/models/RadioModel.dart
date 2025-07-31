import 'package:flutter/material.dart';

class RadioModel<T extends Enum> {
  final String label;
  final String? icon;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final TextStyle textStyle;

  RadioModel({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.textStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
    this.icon,
  });
}
