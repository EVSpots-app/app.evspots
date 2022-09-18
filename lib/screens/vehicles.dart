import 'package:flutter/material.dart';

import 'package:dropdown_textfield/dropdown_textfield.dart';

class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  SingleValueDropDownController ? _cnt;
  MultiValueDropDownController ? _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt!.dispose();
    _cntMulti!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Single selection dropdown with search option",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),
          ),
          const SizedBox(
            height: 20,
          ),
          DropDownTextField(
            // initialValue: "name4",
            controller: _cnt,
            clearOption: false,
            enableSearch: true,
            searchDecoration: const InputDecoration(
                hintText: "enter your custom hint text here"),
            validator: (value) {
              if (value == null) {
                return "Required field";
              } else {
                return null;
              }
            },
            dropDownItemCount: 6,
            dropDownList: const [
              DropDownValueModel(name: 'name1', value: "value1"),
              DropDownValueModel(
                  name: 'name2',
                  value: "value2",
                  toolTipMsg:
                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              DropDownValueModel(name: 'name3', value: "value3"),
              DropDownValueModel(
                  name: 'name4',
                  value: "value4",
                  toolTipMsg:
                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              DropDownValueModel(name: 'name5', value: "value5"),
              DropDownValueModel(name: 'name6', value: "value6"),
              DropDownValueModel(name: 'name7', value: "value7"),
              DropDownValueModel(name: 'name8', value: "value8"),
            ],
            onChanged: (val) {},
          ),

        ],
      ),
    );
  }
}