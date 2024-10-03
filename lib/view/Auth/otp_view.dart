import 'package:flutter/material.dart';
import '../../modelView/Auth/otp_controller.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';
import 'package:get/get.dart';
import '../../modelView/Auth/sign_up_controller.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';
import '../../res/components/custom_text_from_field.dart';
import 'package:provider/provider.dart';


class OtpView extends StatelessWidget {
   OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Consumer<OTpController>(
          builder: (context, value, child) => Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                    fit: BoxFit.cover)),
            child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/appbarLogo.png',
                      height: 80,
                    ),
                    SizedBox(height: 20,),
                   
                  ],
                ),
              ),
               Container(
                      child: Text(
                        'Verify User',
                        style: TextStyle(color: Colors.white,fontSize: 25),
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 40,
                    height: 40,
                    child: TextField(
                      controller: value.otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          if (index < 6 - 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        } else if (value.length == 0 && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
// Optionally, you can use this method to get the OTP in real-time
//_onOtpChanged(otpController.getOtp());
                      },
// _onOtpChanged(_otpController.text);
                    ),
                  );
                }),
              ),
              value.loading ?
              CircularProgressIndicator(color: Colors.white,)
                  :
              CustomButtonWidget(
                  width: size.width * .95,
                  heigth: 50,
                  title: 'Verify Otp',
                  foregroundColor: appColors.buttonTextSelectedPrimaryColor,
                  bgColor: appColors.textBlueColor,
                  selectedFgButtonColor: appColors.buttonTextPrimaryColor,
                  onpress: () {
                    print("yes");
                    final otp = value.getOtp(); // Get the full OTP
                    print("OTP entered: $otp");
                    value.verifyOtp(context);
                  }),


            ],
          ),
        ),
          ),
        ));
  }
}





