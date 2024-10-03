import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../modelView/Auth/sign_up_controller.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';
import '../../res/components/custom_text_from_field.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  void showSnackbar(BuildContext context, String message) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Consumer<SignUpController>(
      builder: (context, value, child) => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
        width: size.width * .98,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Create an Account!',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextInputField(
                          title: 'First Name', controller: value.firstName),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextInputField(
                          title: 'Last Name', controller: value.lastName),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextInputField(
                          keyboard: TextInputType.phone,
                          title: 'Mobile No',
                          controller: value.MobileNumber),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextInputField(
                          title: 'Email Address', controller: value.email),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ChooseGenderWidget(

                      onpress: (v) {
                        value.SelectedGenderValue(v);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  appColors.primaryInputFieldBorder),
                              elevation: MaterialStateProperty.all<double>(
                                  0), // Remove elevation
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      color: appColors
                                          .primaryInputFieldBorder)), // Add border color
                            ),
                            onPressed: () async {
                              // try {
                              //   DateTime? pickedDate = await showDatePicker(
                              //       context: context,
                              //       initialDate:
                              //           DateTime.now(), //get today's date
                              //       firstDate: DateTime(
                              //           2000), //DateTime.now() - not to allow to choose before today.
                              //       lastDate: DateTime(2101));
                              //   // print(value.selectDate);
                              //   // print(pickedDate);
                              //   value.SelectedDateValue(pickedDate);
                              // } catch (e) {
                              //   print(e);
                              // }

                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: value.selectDate ??
                                    DateTime
                                        .now(), // Provide initial date or use current date
                                firstDate: DateTime(
                                    2000), // Example: set the first date to 2000
                                lastDate: DateTime(
                                    2100), // Example: set the last date to 2100
                              );

                              if (picked != null &&
                                  picked != value.selectDate) {
                                value.SelectedDateValue(picked);
                              }
                            },
                            child: value.dateIsEmpty
                                ? const Text('YYYY-MM-DD')
                                : Text(value.selectDate
                                    .toString()
                                    .substring(0, 10))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextInputPasswordFieldForSignUp(
                          title: 'Password', controller: value.password),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextInputPasswordFieldForSignUp(
                          title: 'Repeat Password',
                          controller: value.confrimPassword),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text:
                              'By clicking below to register, you confirm that you agree to our',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: appColors.textPrimaryColor)),
                      TextSpan(
                          text: 'Terms & Conditions ',
                          style: Theme.of(context).textTheme.displayMedium!),
                      TextSpan(
                          text: ' and you have read and understood our ',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: appColors.textPrimaryColor)),
                      TextSpan(
                          text: ' Privacy Policy ',
                          style: Theme.of(context).textTheme.displayMedium),
                    ])),
                const SizedBox(
                  height: 20,
                ),
              value.loading ? 
              CircularProgressIndicator(color: Colors.white,)
              :
                CustomButtonWidget(
                    width: size.width * .95,
                    heigth: 50,
                    title: 'SIGN UP',
                    foregroundColor: appColors.buttonTextSelectedPrimaryColor,
                    bgColor: appColors.textBlueColor,
                    selectedFgButtonColor: appColors.buttonTextPrimaryColor,
                    onpress: () {
                      RegExp regex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (value.firstName.value.text.isEmpty) {
                        showSnackbar(context, "Enter First name");
                      } else if (value.lastName.value.text.isEmpty) {
                        showSnackbar(context, "Enter Last name");
                      } else if (value.MobileNumber.value.text.isEmpty) {
                        showSnackbar(context, "Enter Mobile Number");
                      } else if (value.email.value.text.isEmpty) {
                        showSnackbar(context, "Enter Email Address");
                      } else if (!regex.hasMatch(value.email.value.text)) {
                        showSnackbar(context, "Enter Valid Email Address");
                      } else if (value.selectedGenderValue == null) {
                        showSnackbar(context, "Select Gender");
                      } else if (value.selectDate.toString().isEmpty) {
                        showSnackbar(context, "Select Date Of Birth");
                      } else if (value.password.text.isEmpty) {
                        showSnackbar(context, "Enter Password");
                      } else if (value.confrimPassword.text.isEmpty) {
                        showSnackbar(context, "Enter confrim Password");
                      } else if (value.password.text !=
                          value.confrimPassword.text) {
                        showSnackbar(
                            context, "Password & Confirm Password Not Match");
                      } else {
                        var checkUser = value.registerUser(context);
                        // var checkUser = value.createUserAccount(
                        //     context, value.email.text, value.password.text);
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                Text('Or Register With',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: appColors.textPrimaryColor)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: appColors.textBlueColor,
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: appColors.iconPrimaryColor,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: appColors.primaryRedColor,
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: appColors.iconPrimaryColor,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class ChooseGenderWidget extends StatelessWidget {
  final Function onpress;
  const ChooseGenderWidget({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
      
        isExpanded: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          // Add more decoration..
        ),
        hint: const Text(
          'Choose Gender',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        items: ['Male', 'Female']
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 250, 245, 245)),
                  ),
                ),
                
                )
            .toList(),
             dropdownColor: Color(0xff5a584b),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        
        style: const TextStyle(color: Colors.white),
        onChanged: (value) {
          //Do something when selected item is changed.
          onpress(value);
        },
        onSaved: (value) {
          onpress(value);
        },
       
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class DatePickerExample extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  late DateTime _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : 'Selected Date: ${_selectedDate.toString().substring(0, 10)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            )
          ],
        ),
      ),
    );
  }
}
