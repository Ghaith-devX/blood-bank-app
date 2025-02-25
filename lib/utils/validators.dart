String? validateEmail(String? email) {
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regExp = RegExp(pattern);

  if (email == null || email.isEmpty) {
    return 'الرجاء إدخال بريد إلكتروني';
  } else if (!regExp.hasMatch(email)) {
    return 'الرجاء إدخال بريد إلكتروني صحيح';
  }
  return null;
}

String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return 'الرجاء إدخال اسم المستخدم';
  } else if (username.length < 8) {
    return 'اسم المستخدم يجب أن يحتوي على 8 أحرف على الأقل';
  }
  return null;
}

String? validatePassword(String? password) {
  String pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  RegExp regExp = RegExp(pattern);

  if (password == null || password.isEmpty) {
    return 'الرجاء إدخال كلمة المرور';
  } else if (password.length < 8) {
    return 'كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل';
  } else if (!regExp.hasMatch(password)) {
    return 'كلمة المرور يجب أن تحتوي على حرف كبير، حرف صغير، رقم ورمز خاص';
  }
  return null;
}

String? validateBloodType(String? bloodType) {
  List<String> validBloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  if (bloodType == null || bloodType.isEmpty) {
    return 'الرجاء إدخال نوع الدم';
  } else if (!validBloodTypes.contains(bloodType)) {
    return 'الرجاء إدخال نوع دم صحيح (A+, A-, B+, B-, AB+, AB-, O+, O-)';
  }
  return null;
}

String? validateAddress(String? address) {
  if (address == null || address.trim().isEmpty) {
    return 'الرجاء إدخال العنوان السكني';
  }

  final regex = RegExp(r'^[\p{L}\d\s\-,.]+$', unicode: true);

  if (!regex.hasMatch(address)) {
    return 'الرجاء إدخال عنوان سكني صحيح بدون رموز غير مناسبة';
  }

  if (address.trim().split(RegExp(r'\s+')).length < 2) {
    return 'الرجاء إدخال العنوان بشكل كامل (مثل: المدينة، الحي، الشارع)';
  }

  return null;
}
