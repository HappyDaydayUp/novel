import 'dart:convert';

class FluroConvert {
  static String parmsEcode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  static String parmsDecode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }

  static int string2int(String str) {
    return int.parse(str);
  }

  static double string2double(String str) {
    return double.parse(str);
  }

  static bool string2bool(String str) {
    if (str == 'true') {
      return true;
    } else {
      return false;
    }
  }

  static String object2string<T>(T t) {
    return parmsEcode(jsonEncode(t));
  }

  static Map<String, dynamic> string2map(String str) {
    return json.decode(parmsDecode(str));
  }
}
