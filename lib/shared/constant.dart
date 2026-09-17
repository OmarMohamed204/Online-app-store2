import 'package:flutter/material.dart';

const decorationTextField = InputDecoration(
  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange),
  ),
  filled: true,
  contentPadding: EdgeInsets.all(8),
);

