

String? playerName;
int currentProgress = 0;
int score = 5;

void changeCurrentProgress(int num) {
  currentProgress += num;
}

void changeScore(int num) {
  score += num;
}

const List<Map<String, dynamic>> riddleData = [
  {
    'qrCode':'start_point',
    'simpleContent':'아름다운 그림을 듣는다',
    'content':'아름다운 그림을 듣는다',
  },
  {
    'qrCode':'music_room',
    'simpleContent':'더 큰 세계를 항해하다',
    'content':'더 큰 세계를 항해하다',
    'miniGame':'/miniGameButtonClick'
  },
  {
    'qrCode':'observatory',
    'simpleContent':'계산가가 많다',
    'content':'계산가가 많다',
    'miniGame':'/miniGameTyping'
  },
  {
    'qrCode':'computer_room',
    'simpleContent':'일정한 시각마다 우리에게 시간을 알려주다',
    'content':'일정한 시각마다 우리에게 시간을 알려주다',
    'miniGame':'/miniGameSpeedQuiz'
  },
  {
    'qrCode':'broadcasting_room',
    'simpleContent':'1부터 100까지의 합을 구하다',
    'content':'1부터 100까지의 합을 구하다',
    'miniGame':'/miniGameReactionRate'
  },
  {
    'qrCode':'gauss_room',
    'simpleContent':'Eqog vq vjg uekgpeg echg',
    'content':'Eqog vq vjg uekgpeg echg',
    'miniGame':'/miniGameMatchColor'
  },
  {
    'qrCode':'end_point',
    'simpleContent':'보물 찾기 성공!',
    'content':'보물 찾기 성공!'
  }
];

/*
{
    'qrCode':'aaaa',
    'imagePath':'assets/test.jpeg',
    'simpleContent':'fff',
    'content':'asdfs',
    'miniGame':'/miniGameMatchColor'
  },
 */

