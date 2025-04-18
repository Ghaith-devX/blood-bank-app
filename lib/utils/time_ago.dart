String timeAgo(DateTime date) {
  final difference = DateTime.now().difference(date);

  if (difference.inSeconds < 60) {
    return 'منذ ثوانٍ';
  } else if (difference.inMinutes < 60) {
    return 'منذ ${difference.inMinutes} دقيقة';
  } else if (difference.inHours < 24) {
    return 'منذ ${difference.inHours} ساعة';
  } else {
    return 'منذ ${difference.inDays} يوم';
  }
}
