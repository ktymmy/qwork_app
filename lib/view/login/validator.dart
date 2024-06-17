Future<String> validator(String? value) async {
  try {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
  } catch (e) {
    print('エラー!!!!!!!!: $e');
  }
  throw {};
}
