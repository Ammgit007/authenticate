import 'package:flutter/material.dart';

const textinputdecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white,width: 2),
    borderRadius:BorderRadius.all(Radius.circular(15) ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black,width: 2),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  ),
);