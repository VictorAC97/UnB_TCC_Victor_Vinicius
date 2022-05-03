import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  late SharedPreferences _prefs;
  Map<String, dynamic> infoVideo = {
    "fileName": "",
  };

  AppSettings() {
    _startSettings();
  }
  _startSettings() async {
    await _startPreferences();
    await _readInfoVideo();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readInfoVideo() {
    final fileName = _prefs.getString('fileName') ?? "";

    infoVideo = {
      "fileName": fileName,
    };
  }

  setInfoVideo(String videoName) async {
    await _prefs.setString('fileName', videoName);
    await _readInfoVideo();
  }
}
