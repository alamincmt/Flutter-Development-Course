import 'OnClickInterface.dart';
import 'OnLongClickInterface.dart';

class Button implements OnClickInterface, OnLongClickInterface{


  @override
  void onClick() {
    print("Button Clicked");
  }

  @override
  void onLongClick() {
    print("Button Long Clicked");
  }



}