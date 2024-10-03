import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/fliter_button.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  RangeValues _ageRange = RangeValues(18, 65);
  String _selectedGender = 'Choose your gender';
  // String _selectedNationality = 'Nationality';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Reset',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.textBlueColor,
                        fontSize: 18),
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowsRotate,
                    color: appColors.textBlueColor,
                    size: 20,
                  ),
                ],
              ),
              Text(
                'Advance Filter',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: appColors.textBlueColor),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: appColors.textBlueColor,
                  size: 30,
                ),
              )
            ],
          ),
         
         Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
          FilterButton(
            name: 'People Nearby',
            onTap: () {},
          ),
          FilterButton(
            name: 'Prodession',
            onTap: () {},
          ),
          FilterButton(
            name: 'Nationally',
            onTap: () {},
          ),
                   ],
                     ),
                     Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: appColors.textBlueColor,
              )),
          child: Center(
              child: Text(
            'Mauves-sur-Loire',
            style: TextStyle(color: appColors.textBlueColor),
          ))),
                     SizedBox(height: 16),
                     Text('Select age:'),
                     RangeSlider(
                   values: _ageRange,
                   min: 18,
                   max: 65,
                   divisions: 47,
                   labels: RangeLabels(
          _ageRange.start.round().toString(),
          _ageRange.end.round().toString(),
                   ),
                   onChanged: (RangeValues values) {
          setState(() {
            _ageRange = values;
          });
                   },
                     ),
                     SizedBox(height: 16),
                     Container(
                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                   width: double.infinity,
                   decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: appColors.textBlueColor,
            )),
                   child: DropdownButton<String>(
          isExpanded: true,
          borderRadius: BorderRadius.circular(40),
          // dropdownColor: Colors.transparent,
          underline: Container(),
          value: _selectedGender,
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue.toString();
            });
          },
          items: <String>['Choose your gender', 'Male', 'Female']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
                   ),
                     ),
                     SizedBox(height: 16),
              
                     GestureDetector(
                   onTap: () {},
                   child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: appColors.textBlueColor,
              borderRadius: BorderRadius.circular(40)),
          child: Text(
            'Apply filter',
            style: TextStyle(color: appColors.textPrimaryColor),
          ),
                   ),
                     ),
                     SizedBox(height: 16),

        ],
      ),
    );
  }
}
