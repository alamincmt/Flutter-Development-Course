import 'package:quiz_app/model/sura_data.dart';

class SuraResponse {
  final int code;
  final String status;
  final List<SuraData> data;

  SuraResponse(this.code, this.status, this.data);
}