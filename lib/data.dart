

String? playerName;
int currentProgress = 0;
int score = 5;

void changeCurrentProgress(int num) {
  currentProgress += num;
}

void changeScore(int num) {
  score += num;
}

List<Map<String, dynamic>> riddleData = [
  {
    'qrCode':'aaaa',
    'imagePath':'assets/test.jpeg',
    'simpleContent':'fff',
    'content':'asdfs',
    'miniGame':'/miniGameMatchColor'
  },
  {
    'qrCode':'bbbb',
    'simpleContent':'gdsk',
    'content':'dsg',
    'miniGame':'/miniGameButtonClick'
  },
  {
    'qrCode':'cccc',
    'simpleContent':'보물 찾기 성공!',
    'content':'보물 찾기 성공!'
  }
];

