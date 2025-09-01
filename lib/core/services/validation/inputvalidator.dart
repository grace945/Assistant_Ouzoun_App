
class InputValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!value.contains('@')) return "Invalid email";
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password too short";
    if (value.length < 6) {
      return 'The password should containe at least 6 number';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'The password must contain at least one uppercase letter.';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'The password must contain at least one special character';
    }
    return null;
  }

  static String?validatephonenumber(String?value){
    if(value==null ||value.isEmpty) return "Your phone number must not be empty";
  }
  static String?validateName(String?value){
    if(value==null||value.isEmpty) return "Your  name must not be empty";
    return null;
  }
}
