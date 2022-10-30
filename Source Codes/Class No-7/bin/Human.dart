class Human{  
   //Overridden method  
    void run()  
   {  
      print("Human is running");  
   }  
}  
class Man extends Human{  
   //Overriding method  
    void run(){  
      print("Man is running");  
   }  
}  
void main(){  
      Man m = new Man();  
      //This will call the child class version of run()  
      m.run();  
}  