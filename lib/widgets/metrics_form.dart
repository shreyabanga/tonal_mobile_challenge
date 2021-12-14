import 'package:flutter/material.dart';
import 'package:tonal_mobile_challenge/styles.dart';

class MetricsForm extends StatelessWidget {
  final Function(Map<String,Object>) notifyParent;
  MetricsForm({Key? key, required this.notifyParent}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onSaved: (newValue) {
                label = newValue!;
              },
              decoration: labelFormDecoration,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              cursorColor: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onSaved: (newValue) {
                weight = int.parse(newValue!);
              },
              keyboardType: TextInputType.phone,
              decoration: weightFormDecoration,
              cursorColor: Colors.green,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: doneButtonStyle,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  notifyParent({'weight':weight,'label':label});
                 
                }
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                child: Text('Done'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
