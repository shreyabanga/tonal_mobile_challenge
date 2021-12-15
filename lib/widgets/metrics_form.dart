import 'package:flutter/material.dart';
import 'package:tonal_mobile_challenge/styles.dart';

class MetricsForm extends StatelessWidget {

  /* Callback function to send the user entered values back to the parent */
  final Function(Map<String, Object>) notifyParent;

  MetricsForm({Key? key, required this.notifyParent}) : super(key: key);

  /* Used for getting the individual values from the form */
  final formKey = GlobalKey<FormState>();
  String label = "";
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          labelTextField(),
          weightTextField(),
          submitButton(),
        ],
      ),
    );
  }


  

  Padding submitButton() {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: doneButtonStyle,
            onPressed: () {
              /* Validates and saves the form values. Then sends it back 
                to the parent using the callback function.
              */
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                notifyParent({'weight': weight, 'label': label});
              }
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              child: Text('Submit'),
            ),
          ),
        );
  }

  Padding weightTextField() {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onSaved: (newValue) {
              /* When user clicks submit button, the values are saved 
                in the local vars.
              */
              weight = int.parse(newValue!);
            },
            keyboardType: const TextInputType.numberWithOptions(signed:true),
            decoration: weightFormDecoration,
            cursorColor: Colors.green,
            validator: (value) {
              /* Checks if values are empty or not and displays 
                appropriate message
              */
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              /* Checks if values are only numeric and if not, 
                displays the error message.
              */
              if (!value.contains(RegExp(r'^-?[0-9]+$'))) {
                return 'Please enter numeric values';
              }
              return null;
            },
          ),
        );
  }

  Padding labelTextField() {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onSaved: (newValue) {
              /* When user clicks submit button, the values are saved 
                in the local vars.
              */
              label = newValue!;
            },
            decoration: labelFormDecoration,
            validator: (value) {
              /* Checks if values are empty or not and displays 
                appropriate message
              */
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            cursorColor: Colors.green,
          ),
        );
  }
}
