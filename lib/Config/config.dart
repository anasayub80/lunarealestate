import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

String bullet = "\u2022";
Color mainColor = Color(0xffB48717);
var Base_URL = 'https://app.lunaenterprises.info/api/';
var TOKEN = 'C8xWxGvIue37SwP2MEU7W5oKE32fm7Z3JxHfeK897a8eE0SdLl';
var LOGIN_URL = '${Base_URL}login'.trim();
var DELETE_PROPERTY_URL = '${Base_URL}deleteProperty'.trim();
var DELETE = '${Base_URL}delete'.trim();
var UPDATE_PROFILE_URL = '${Base_URL}profile'.trim();
var SIGNUP_URL = '${Base_URL}signup'.trim();
var FORM_URL = '${Base_URL}addProperty'.trim();
var GET_IMAGES_URL = '${Base_URL}propgallery'.trim();
var UPDATE = '${Base_URL}update'.trim();
var FORGOT = '${Base_URL}forgot'.trim();
var FETCH_ADMIN_PROPERTY = '${Base_URL}fetchPropperty'.trim();
var FETCH_USERS = '${Base_URL}fetchusers'.trim();
var FETCH_FULL_HOUSE_URL = '${Base_URL}houseDetails'.trim();
// var UPLOAD_URL = '${Base_URL}login'.trim();
var FETCH_PROPERTY = '${Base_URL}fetchHouse'.trim();
var SET_NEW_PASSWORD = '${Base_URL}newpass';
AutoSizeText headingText(String text) {
  return AutoSizeText(
    text,
    maxLines: 5,
    maxFontSize: 18,
    minFontSize: 14,
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text paragraphText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
  );
}

SizedBox bSpace() {
  return SizedBox(
    height: 13,
  );
}

SizedBox nSpace() {
  return SizedBox(
    height: 8,
  );
}
