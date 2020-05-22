import 'dart:io';
import 'package:dio/dio.dart';

class Service {
  final dio = Dio(
    BaseOptions(
      headers: {
        HttpHeaders.acceptHeader:
            'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        HttpHeaders.userAgentHeader:
            'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36',
      },
    ),
  );
}
