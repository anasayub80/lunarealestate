import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  Future<void> oneSignalLogout() async {
    final SharedPreferences sps = await SharedPreferences.getInstance();
    sps.remove('oneSignalSetup');
    OneSignal.User.removeTag("role");
    OneSignal.User.removeAlias("uid");
    OneSignal.logout();
  }

  void updateOneSignalMode(String role) {
    OneSignal.User.removeTag("role");
    OneSignal.User.addTagWithKey("role", role.trim());
  }

  Future<void> configOneSignal(BuildContext context) async {
    OneSignal.initialize("8e7c56b7-6242-4977-978e-d1b71073f325");
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.Notifications.requestPermission(true);
    OneSignal.Notifications.clearAll();

    // bool isHandled = false; // Flag to track if click listener handled the event

    OneSignal.Notifications.addPermissionObserver((state) {
      log("Has permission " + state.toString());
    });

    OneSignal.Notifications.addClickListener((event) async {
      Map<String, dynamic>? additionalData = event.notification.additionalData;
      if (additionalData!.entries.isNotEmpty &&
          additionalData.containsKey("screenName")) {
        debugPrint("OneSignal screenName ${additionalData['screenName']}");
        // isHandled = true; // Set the flag to true

        switch (additionalData["screenName"]) {
          case 'riderOffers':
            if (additionalData["rideType"] != 'Private') {}
            break;
          default:
        }
        return; // Exit the click listener
      }
    });
  }

  setOneSignalId(String uid, String role) async {
    final SharedPreferences sps = await SharedPreferences.getInstance();

    bool isSetup = await sps.getBool("oneSignalSetup") ?? false;
    if (!isSetup) {
      debugPrint("Setup OneSignal ID $uid  $role");
      sps.setBool("oneSignalSetup", true);
      OneSignal.login(uid);
      OneSignal.User.addAlias("uid", uid);
      OneSignal.User.addTagWithKey("role", role.trim());
      debugPrint("addTagWithKey $role");
    } else {
      debugPrint(
          "Already addTagWithKey Setup OneSignal ID $uid & ${role.trim()}");
    }
    return true;
  }

  static void sendNotification(String externalUserId, String message,
      Map<String, dynamic> additionalData) async {
    debugPrint("send noti to $externalUserId");
    try {
      var url = "https://onesignal.com/api/v1/notifications";
      var headers = {
        "Content-Type": "application/json; charset=utf-8",
        "Authorization":
            "Basic os_v2_org_xkre3rjdj5egxpdc7qipbp2hpw3olg2harbulx5sxg7mbyspwiiu3wszowh6vn6fnyykjtf4ft2qxbdvfhypf7wjpcb6ra5paxfejaa", //from one signal auth key
      };
      var body = {
        "app_id": "8e7c56b7-6242-4977-978e-d1b71073f325",
        "contents": {"en": message},
        "data": additionalData, // Include additional data here
        "include_aliases": {
          "external_id": [externalUserId]
        },
        "target_channel": "push",
      };
      var response = await postReq(endPoint: url, headers: headers, data: body);

      if (response.statusCode == 200) {
        debugPrint(
            "OneSignal Notification sent successfully to $externalUserId");
      } else {
        debugPrint("Error sending notification: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static postReq(
      {String? endPoint, Map<String, dynamic>? headers, dynamic data}) async {
    try {
      // Make the POST request
      Dio dio = Dio();
      var response = await dio.post(
        endPoint!,
        options: Options(headers: headers ?? {}),
        data: data ?? {},
      );
      debugPrint("dio from post====<${response.toString()}");
      return response;

      // Handle the response
    } catch (e) {
      debugPrint("post api res e====>$e");
      if (e is DioException) {
        debugPrint("post api res e====>${e.response}");
        debugPrint("post api res e====>${e.response}");
        // debugPrint("post api res e====>${e.response!.statusMessage!}");
        // debugPrint("post api res e====>${e.response!.data!}");

        if (e.response != null) {
          return e.response!;
        }
      } else {
        debugPrint("from api service e====>$e");
        rethrow;
      }
    }
  }
}
