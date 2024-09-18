import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import '../Pages/Survery/surveyData.dart';

class backend {
  launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  loginAccount(dynamic data) async {
    print(LOGIN_URL);
    http.Response res = await http.post(Uri.parse(LOGIN_URL), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        Map<String, dynamic> map = json.decode(res.body);

        return map;
      } else {
        print('Something Wrong');
      }
    }
  }

  deleteProperty(dynamic data) async {
    http.Response res =
        await http.post(Uri.parse(DELETE_PROPERTY_URL), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var data = json.decode(res.body);
        print(data);
        return data;
      } else {
        print('Something Wrong');
      }
    }
  }

  delete(dynamic data) async {
    http.Response res = await http.post(Uri.parse(DELETE), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var data = json.decode(res.body);
        print(data);
        return data;
      } else {
        print('Something Wrong');
      }
    }
  }

  forgotPassword(dynamic data) async {
    http.Response res = await http.post(Uri.parse(FORGOT), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var data = json.decode(res.body);
        return data;
      } else {
        print('Something Wrong');
      }
    }
  }

  fetchProperty(String uid) async {
    print("$uid my uid");
    List arraydata;
    http.Response res = await http.post(Uri.parse(FETCH_PROPERTY), body: {
      'user_id': uid,
    });
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        if (res.body.length <= 64) {
          // no data found
          return null;
        } else {
          arraydata = json.decode(res.body);
          return arraydata;
        }
      } else {
        print('Something Wrong');
      }
    }
  }

  fetchAdminUsers(dynamic data) async {
    List arraydata;
    http.Response res = await http.post(Uri.parse(FETCH_USERS), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        if (res.body.length <= 64) {
          // no data found
          return null;
        } else {
          arraydata = json.decode(res.body);
          return arraydata;
        }
      } else {
        print('Something Wrong');
      }
    }
  }

  fetchPropertyImages(String formid) async {
    http.Response res = await http.post(Uri.parse(GET_IMAGES_URL), body: {
      'formid': formid,
    });
    List arraydata;
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        res.body.length == 64 ? log('error') : log('array ${res.body.length}');
        if (res.body.length == 64) {
          // no data found
          return null;
        } else {
          arraydata = json.decode(res.body);
          return arraydata;
        }
      } else {
        print('Something Wrong');
      }
    }
  }

  fetchFullPropertyDetails(String formid) async {
    http.Response res = await http.post(Uri.parse(FETCH_FULL_HOUSE_URL), body: {
      'formid': formid,
    });
    List arraydata;

    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        arraydata = json.decode(res.body);
        return arraydata;
      }
    } else {
      print('Something Wrong');
    }
  }

  updateAccountwithOutImage(dynamic data) async {
    http.Response res =
        await http.post(Uri.parse(UPDATE_PROFILE_URL), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        Map<String, dynamic> map = json.decode(res.body);
        print('updateAccountwithOutImage res ${map.toString()}');

        return map;
      } else {
        print('Something Wrong');
      }
    }
  }

  update(dynamic data) async {
    http.Response res = await http.post(Uri.parse(UPDATE), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var data = json.decode(res.body);
        return data;
      } else {
        print('Something Wrong');
      }
    }
  }

  updateAccountwithImage(dynamic data, File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse(UPDATE_PROFILE_URL));
    if (imageFile != File('')) {
      var stream = http.ByteStream(imageFile.openRead());
      stream.cast();
      var length = await imageFile.length();

      var multiport = http.MultipartFile('profile', stream, length,
          contentType: MediaType('png', 'jpg'), filename: imageFile.path);

      request.files.add(multiport);
    }
    request.fields['token'] = TOKEN;
    request.fields['userid'] = data['id'];
    request.fields['name'] = data['name'];
    request.fields['phone'] = data['phone'];
    request.fields['email'] = data['email'];
    var response = await request.send();
    // print(response.stream.toString());
    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      print('respStr ${respStr.toString()}');
      Map<String, dynamic> map = json.decode(respStr.toString());
      print('image uploaded ${map.toString()}');

      return map;
    } else {
      return 'Something Wrong';
    }
  }

  Future uploadImageToServer(BuildContext context) async {
    try {
      final formData = <String, dynamic>{};
      for (var i = 0; i < images.length; i++) {
        final File file = File(images[i].path);
        String fileName = file.path.split('/').last;
        formData.addAll({
          "gallery[$i]": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
            contentType: MediaType("image", "jpeg"), //important
          ),
        });
      }
      formData.addAll({
        "tab": "image",
        // ignore: use_build_context_synchronously
        "formid": Provider.of<SurvProvider>(context, listen: false).formid,
      });
      FormData form = FormData.fromMap(formData);
      final res = await Dio().post(FORM_URL, data: form);
      log(res.data.toString());
      return res.data;
    } catch (e) {
      log("Error **${e.toString()}");
    }
  }

  signUpAccount(dynamic data) async {
    http.Response res = await http.post(Uri.parse(SIGNUP_URL), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var response = jsonDecode(res.body.toString());
        print(response);
        return response;
      } else {
        print('Something Wrong');
      }
    }
  }

  fetchAdminPropery(dynamic data) async {
    http.Response res =
        await http.post(Uri.parse(FETCH_ADMIN_PROPERTY), body: data);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var response = jsonDecode(res.body.toString());
        print(response);
        return response;
      } else {
        print('Something Wrong');
      }
    }
  }

  fetchMoreAdminProperty(dynamic data) async {
    http.Response res =
        await http.post(Uri.parse(FETCH_ADMIN_PROPERTY), body: data);
    List arraydata;
    if (res.statusCode == 200) {
      if (res.body.length <= 64) {
        log('No data found');
        // no data found
        return null;
      } else {
        arraydata = json.decode(res.body);
        log(arraydata.toString());
        return arraydata;
      }
    } else {
      print('Something Wrong');
    }
  }

  submitForm(dynamic data) async {
    try {
      http.Response res = await http.post(Uri.parse(FORM_URL),
          body: data, headers: {"Accept": "application/json"});
      if (res.statusCode == 200) {
        if (res.body.isNotEmpty) {
          var response = jsonDecode(res.body);
          return response;
        } else {
          return 'error';
        }
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }

  setNewAccount(dynamic data) async {
    http.Response res =
        await http.post(Uri.parse(SET_NEW_PASSWORD), body: data);
    if (res.statusCode == 200) {
      debugPrint('done');
      if (res.body.isNotEmpty) {
        var response = jsonDecode(res.body);
        if (response['status'] == 'success') {
          return "1";
        } else {
          return "0";
        }
      }
      // return '1';
    }
  }
}
