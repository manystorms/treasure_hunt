import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

late RiddleData riddleData;

class RiddleData {
  final int riddleNum;
  final List<String?> content;
  final List<String?> simpleContent;
  final List<String?> imageUrl;

  RiddleData({
    required this.riddleNum,
    required this.content,
    required this.simpleContent,
    required this.imageUrl,
  });

  static Future<RiddleData> getData() async {
    final documentSnapshot = await firestore.collection('treasure').doc('riddle').get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();

      if (data != null) {
        final int riddleNum = data['riddleNum'] ?? 0;
        final List<Map<String, dynamic>> riddleList = List<Map<String, dynamic>>.from(data['riddleList'] ?? []);
        final List<String?> content = riddleList.map((item) => item['content'] as String?).toList();
        final List<String?> simpleContent = riddleList.map((item) => item['simpleContent'] as String?).toList();
        final List<String?> imageUrl = riddleList.map((item) => item['imageUrl'] as String?).toList();

        return RiddleData(
          riddleNum: riddleNum,
          content: content,
          simpleContent: simpleContent,
          imageUrl: imageUrl,
        );
      }
    }
    throw Exception('Error: 데이터를 불러올 수 없습니다.');
  }
}
