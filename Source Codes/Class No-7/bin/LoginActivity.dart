import 'FlutterActivity.dart';

class LoginActivity extends FlutterActivity{

  @override
  int add(int num1, int num2) {
    return num1 + num2;
  }

  @override
  void onCreate(int layoutId) {
    super.onCreate(layoutId);

    print("onCreate from Login Activity");
  }

  // @override
  // void onResume() {
  //   super.onResume();
  //   print("onResume from Login Activity");
  // }
}