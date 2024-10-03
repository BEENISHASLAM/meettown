import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_button.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
          Text(
                      "Preferences",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: appColors.textBlueColor),
                    ),
            SizedBox(height: 16,),
      
          Text(
                      "Total Preferences : 5",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
                    ),
            SizedBox(height: 16,),
      
        
        
                    TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      labelText: 'Preferred airport',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(40))
                    ),),
            SizedBox(height: 16,),
      
                    TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      labelText: 'Preferred airLine',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(40))
                    ),),
            SizedBox(height: 16,),
      
                    TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      labelText: 'Membar Alliance',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(40))
                    ),),
            SizedBox(height: 16,),
            Center(child: CustomButton(title: 'Save', onTap: (){}))
      
        ],),
      ),
    );
  }
}