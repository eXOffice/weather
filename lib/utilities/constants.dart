import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 100,
);

const kMessageTextStyle = TextStyle(
  fontSize: 60,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30,
);

const kConditionTextStyle = TextStyle(
  fontSize: 85,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'City Name',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    )
    // border: OutlineInputBorder(
    //   borderRadius: constBorderRadius.circular(10),
    //   borderSide: BorderSide.none,
    // ),
    );
