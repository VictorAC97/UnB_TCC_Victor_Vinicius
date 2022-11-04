import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _prefs;
  Map<String, dynamic> infoVideo = {
    "fileName": "",
  };

  Map<String, dynamic> infoDificuldade = {
    "dificuldade": "",
  };

  AppSettings() {
    _startSettings();
  }
  _startSettings() async {
    await _startPreferences();
    await _readInfoVideo();
    await _readInfoDificuldade();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readInfoVideo() {
    final fileName =
        _prefs.getString('fileName') ?? "Organizar_DeuCertoVcAcertou1.3gp";

    infoVideo = {
      "fileName": fileName,
    };
    notifyListeners();
  }

  _readInfoDificuldade() {
    final modoDificuldade = _prefs.getString('dificuldade') ?? "arrastar";

    infoDificuldade = {
      "dificuldade": modoDificuldade,
    };
    notifyListeners();
  }

  setInfoVideo(String videoName) async {
    await _prefs.setString('fileName', videoName);
    await _readInfoVideo();
  }

  setInfoDificuldade(String dificuldade) async {
    await _prefs.setString('dificuldade', dificuldade);
    await _readInfoDificuldade();
  }
}
