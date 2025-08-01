import 'package:flutter/foundation.dart';

class PlantProvider with ChangeNotifier{
    int tuoi=0;
   final int tuoimax=5;
   int get gettuoi => tuoi;
   bool get getno => tuoi>=tuoimax;



   void tuoicay(){
     if(tuoi<tuoimax){
       tuoi++;
       notifyListeners();
     }
   }
   void datlai(){
     tuoi=0;
     notifyListeners();
   }

}
