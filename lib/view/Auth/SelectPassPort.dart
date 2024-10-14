import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/modelView/Auth/completed_profile_controller.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_button.dart';
import 'package:meettown/view/BottomNavbar/BottomNavbar.dart';
import 'package:provider/provider.dart';

class PassportPage extends StatefulWidget {
  @override
  _PassportPageState createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  String? selectedLanguage;
  String? selectedProfession;
  String? selectNationalty ;
  String selecteducation = 'No formal education';
  String selectchildren = 'None';
  String selectbody = 'Slim';
  String selectheight = 'Below 4 feet';
  String? selectrelationShip;
  String? selectLookingFor;

    var loading = false;

 setLoading(val){
    loading=val;
setState(() {
  
});

  }
  var controller = Get.put(CompletedProfileController());

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: appColors.textBlueColor,
        title: Text('My Passport'),
        centerTitle: true,
      ),
      body:
      Consumer<CompletedProfileController>(
      builder: (context, value, child) =>
       SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  'Select Language:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                hint: Text("Select Language", style: TextStyle(
                  fontSize: 15,
                      color: Colors.white)),
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectedLanguage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items:controller.languageOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                       child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Profession:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0), // Set border width and color
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),

                  value: selectedProfession,
                  hint: Text("Select Profession", style: TextStyle(
                   
                      color: Colors.white)),
                  onChanged: (newValue) {
                    setState(() {
                      selectedProfession = newValue!;
                    });
                  },
                  items: controller.professionOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  dropdownColor: Color(0xff5a584b),
                  // Set background color of dropdown menu
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Nationalty:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  hint: Text("select Nationalty",style: TextStyle(color: Colors.white),),
                  value: selectNationalty,
                  onChanged: (newValue) {
                    setState(() {
                      selectNationalty = newValue!;
                    });
                  },
                  items: controller.nationalityOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
             
                SizedBox(height: 20),
                Text(
                  'Select RelationShip:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectrelationShip,
                  onChanged: (newValue) {
                    setState(() {
                      selectrelationShip = newValue!;
                    });
                  },
                  hint: Text("select relationShip",style: TextStyle(color: Colors.white),),
                  items:controller.relationshipOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                   SizedBox(height: 10),
                 Text(
                  'Looking For:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectLookingFor,
                  onChanged: (newValue) {
                    setState(() {
                      selectLookingFor = newValue!;
                    });
                  },
                  hint: Text("select Looking For",style: TextStyle(color: Colors.white),),
                  items:controller.LookingFor
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                // SizedBox(height: 20),
                // Text(
                //   'Select RelationShip:',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
                // SizedBox(height: 10),
                // DropdownButtonFormField<String>(
                //   isExpanded: true,
                //   isDense: true,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       borderSide: BorderSide(color: Colors.blue, width: 2.0),
                //     ),
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                //   ),
                //   value: selectrelationShip,
                //   onChanged: (newValue) {
                //     setState(() {
                //       selectrelationShip = newValue!;
                //     });
                //   },
                //   items: relationshipOptions
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //      child: Text(value,style: TextStyle(color: Colors.white),),
                //     );
                //   }).toList(),
                //     dropdownColor: Color(0xff5a584b),
                // ),
                SizedBox(height: 20),
                Text(
                  'Select Education:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selecteducation,
                  onChanged: (newValue) {
                    setState(() {
                      selecteducation = newValue!;
                    });
                  },
                  items:controller.educationOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                       child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
 SizedBox(height: 20),
                Text(
                  'Select Intersets:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                 Container(
                  height: 250,
            child:  GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of buttons per row
                childAspectRatio: 2.5, // Button aspect ratio
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.interests.length,
              itemBuilder: (context, index) {
                bool isSelected = controller.selectedInterests.contains(controller.interests[index]);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        controller.selectedInterests.remove(controller.interests[index]);
                      } else {
                       controller. selectedInterests.add(controller.interests[index]);
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: isSelected ? appColors.textBlueColor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          controller.interests[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
              
                     Column(
                      children: [
                        loading  ?Center(child: CircularProgressIndicator(color: Colors.white,)):
                        Center(
                        child: Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButtonWidget(
                                  title: 'Previous',
                                  foregroundColor: appColors.iconPrimaryColor,
                                  bgColor: appColors.textBlueColor,
                                  selectedFgButtonColor: appColors.iconPrimaryColor,
                                  onpress: () {}),
                            
                           
                              CustomButtonWidget(
                                  title: 'Submit',
                                  foregroundColor: appColors.iconPrimaryColor,
                                  bgColor: appColors.textBlueColor,
                                  selectedFgButtonColor: appColors.iconPrimaryColor,
                                  onpress: () async {
                                    if(selectedLanguage==null){
                                      Get.snackbar("Error","Please Select Language" );
                        
                                    }
                                    else  if(selectedProfession==null){
                                      Get.snackbar("Error","Please Select Profession" );
                        
                                    }
                                     else  if(selectNationalty==null){
                                      Get.snackbar("Error","Please Select Nationalty" );
                        
                                    }
                                     else  if(selectrelationShip==null){
                                      Get.snackbar("Error","Please Select RelationShip" );
                        
                                    }
                                      else  if(selectLookingFor==null){
                                      Get.snackbar("Error","Please Select Looking For" );
                        
                                    }
                                     else  if(selecteducation==null){
                                      Get.snackbar("Error","Please Select Education" );
                        
                                    }
                                    else{
                                      setState(() {
                                        loading=true;
                                      });
                                    //controller.storeOtherInfoDb(context,selectedLanguage,selectedProfession,selectNationalty,selectrelationShip,selecteducation);
                                  await  controller.createProfile(context,selectedLanguage,selectedProfession,selectNationalty,selectrelationShip,selecteducation,selectLookingFor);
                                     setState(() {
                                        loading=false;
                                      });
                                   
                                    }
                                  //                    Navigator.push(context,
                                  // MaterialPageRoute(builder: (context) => CustomNavbar())
                                  // );
                                  }),
                            ],
                          ),
                        ),
                                      ),
                      ],
                    
                  
                )
              ],
            ),
          ),)
        ),
      ),
    );
  }
}
