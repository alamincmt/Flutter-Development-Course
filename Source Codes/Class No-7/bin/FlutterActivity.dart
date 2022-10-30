abstract class FlutterActivity{
  int layoutToShow = 0;
  void onCreate(int layoutId) {
    this.layoutToShow = layoutId;
    print("onCreate Called");
  }

  int add(int num1, int num2);

  void onResume(){
    if(layoutToShow == 100){
      print("Show 100 number view");
    }
    print("onResume called");
  }
}