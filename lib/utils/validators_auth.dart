import 'package:firebase_auth/firebase_auth.dart';

String getFirebaseAuthErrorMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'email-already-in-use':
      return "البريد الإلكتروني مسجل مسبقًا. يرجى تسجيل الدخول.";
    case 'invalid-email':
      return "البريد الإلكتروني غير صالح.";
    case 'weak-password':
      return "كلمة المرور ضعيفة جدًا. يرجى اختيار كلمة مرور أقوى.";
    case 'user-disabled':
      return "تم تعطيل هذا الحساب. يرجى التواصل مع الدعم.";
    case 'user-not-found':
      return "لا يوجد حساب بهذا البريد الإلكتروني.";
    case 'wrong-password':
      return "كلمة المرور غير صحيحة. يرجى المحاولة مجددًا.";
    case 'too-many-requests':
      return "تم حظر المحاولات لفترة وجيزة بسبب محاولات كثيرة. يرجى المحاولة لاحقًا.";
    case 'operation-not-allowed':
      return "عملية تسجيل الدخول غير مفعلة لهذا البريد.";
    case 'network-request-failed':
      return "فشل الاتصال بالشبكة. يرجى التحقق من الإنترنت والمحاولة مجددًا.";
    case 'invalid-credential':
      return "بيانات الاعتماد غير صحيحة أو منتهية الصلاحية.";
    default:
      return "الرجاء إدخال بريد إلكتروني";
  }
}
