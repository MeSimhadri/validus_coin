String? validateEmail(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  if (!regex.hasMatch(value!)) {
    return 'Please Enter Valid Email';
  } else {
    return null;
  }
}

String? validateString(String? value, String error) {
  if (value!.trim().isEmpty) {
    return error;
  } else {
    return null;
  }
}
