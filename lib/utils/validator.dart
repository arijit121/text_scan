class Validator {
  ///  mobile validation
  String? validateMobile(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Enter Mobile Number';
    } else if (!regExp.hasMatch(value)) {
      return "Enter a Valid Number";
    } else if (value.length != 10) {
      return "Enter a valid Mobile number";
    } else {
      return null;
    }
  }

  ///  mobile validation
  String? validatePassportno(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Enter Passport Number';
    } else if (!regExp.hasMatch(value)) {
      return "Enter a Valid Passport Number";
    } else if (value.length != 12) {
      return "Enter a valid Passport Number";
    } else {
      return null;
    }
  }

  ///  pin code validation
  String? validatePincode(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Enter Pin Code';
    } else if (!regExp.hasMatch(value)) {
      return "Enter a Valid Pin Code";
    }
    // else if (value.length != 6) {
    //   return "Enter a Valid Pin Code";
    // }
    else {
      return null;
    }
  }

  ///  pin validation
  String? validatePin(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Enter Pin';
    } else if (!regExp.hasMatch(value)) {
      return "Enter a Valid Pin";
    } else if (value.length < 4) {
      return "Enter a valid Pin";
    } else {
      return null;
    }
  }

  ///  email validation
  String? validateEmail(String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty) {
      return 'Enter Email';
    } else if (!regex.hasMatch(email)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  ///  password validator
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Enter Password';
    } else if (password.length < 4) {
      return 'Password should be 4 character';
    } else {
      return null;
    }
  }

  /// confirm password validator
  String? validateConfirmPassword(String? password, String? cPassword) {
    if (cPassword == null || cPassword.isEmpty) {
      return 'Enter Confirm Password';
    } else if (cPassword != password) {
      return "Confirm password doesn't match with Password";
    } else {
      return null;
    }
  }

  /// text validation
  String? textFieldValidation(String? value, String? msg) {
    String pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-.]';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return msg ?? "Enter $msg ";
    } else if (regex.hasMatch(value)) {
      return "Invalid $msg";
    } else if (value.length < 3) {
      return "$msg should be more than 3 ";
    } else {
      return null;
    }
  }

  /// Address validation
  String? validateAddress(String? value) {
    String pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%.]';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Enter Address" ?? "Enter Valid Address";
    } else if (regex.hasMatch(value)) {
      return "Enter Valid Address";
    } else if (value.length < 3) {
      return "Enter Valid Address";
    } else {
      return null;
    }
  }

  /// User id validation
  String? validateUser_id(String? value) {
    String pattern = r'[!<>?":_`~;[\]\\|=+)(*^%]';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Enter User id" ?? "Enter Valid User id";
    } else if (regex.hasMatch(value)) {
      return "Enter Valid User id";
    } else if (value.length < 3) {
      return "Enter Valid User id";
    } else {
      return null;
    }
  }

  /// Email\Number validation
  String? validateEmailNumber(String? value) {
    String patternEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String patternNumber = r'(^[0-9]*$)';
    RegExp regexEmail = RegExp(patternEmail);
    RegExp regexNumber = RegExp(patternNumber);
    if (value == null || value.isEmpty) {
      return 'Enter Valid Email/Mobile Number';
    } else if ((!regexEmail.hasMatch(value)) &&
        (!regexNumber.hasMatch(value) || (value.length != 10))) {
      return 'Enter Valid Email/Mobile Number';
    } else {
      return null;
    }
  }
}
