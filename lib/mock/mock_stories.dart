import 'package:first_flutter_project/model/story_info.dart';
import '../model/story_list.dart';

class StoryData extends Stories {
  StoryData({required super.stories});

  static Stories fetchData() {
    return Stories(
      stories: <Story>[
        Story(
          iD: 01,
          image: 'images/image2.jpeg',
          catagory: 'Thriller',
          sname: 'Deathly Hollows',
          sbody:
              'In the heart of the forest, a whispering wind carried tales of the Deathly Hollows, ancient artifacts rumored to hold immense power. Brave souls sought them, driven by greed or desperation. One by one, they vanished into the shadows, consumed by the allure of the unknown. Only a solitary figure remained, grappling with the choice: pursue the forbidden knowledge or heed the warnings of those who came before. In the end, the choice was made, sealing their fate within the dark embrace of the Deathly Hollows.',
        ),
        Story(
          iD: 02,
          image: 'images/image3.jpeg',
          catagory: 'Nature',
          sname: 'Echoes of Eternity',
          sbody:
              'Amidst ruins bathed in moonlight, whispers echoed through the corridors, tales of lost civilizations and forgotten magic. Intrigued by the promise of ancient secrets, adventurers dared to tread where others feared. Yet, with every step deeper into the labyrinth, they felt time itself unraveling around them. In the heart of the ruins, they uncovered a relic, pulsing with the echoes of eternity, a reminder of powers long dormant.',
        ),
        Story(
          iD: 03,
          image: 'images/image4.png',
          catagory: 'Adventure',
          sname: 'Crimson Horizons',
          sbody:
              'Beneath a blood-red sky, the horizon stretched endlessly, a canvas painted with the hues of impending darkness. Travelers embarked on a journey across the barren wasteland, seeking salvation in the distant unknown. As they pressed forward, shadows danced on the crimson sands, whispering secrets of forgotten lands and ancient curses. With every step, the horizon seemed to recede, mocking their futile pursuit of sanctuary.',
        ),
        Story(
          iD: 04,
          image: 'images/image5.jpg',
          catagory: 'Thriller',
          sname: 'Whispers of the Void',
          sbody:
              'In the depths of space, where stars whispered tales of creation and destruction, a lone spacecraft drifted aimlessly. Its crew, haunted by whispers from the void, ventured into the unknown abyss in search of answers. Yet, as they delved deeper into the cosmic mysteries, reality itself began to unravel, consumed by the endless void. In the silence between stars, they found not solace, but the chilling embrace of the whispers of the void.',
        ),
        Story(
          iD: 05,
          image: 'images/image06.avif',
          catagory: 'Love',
          sname: 'Eternal Embrace',
          sbody:
              'In the crumbling ruins of an ancient temple, a love story unfolded, transcending time and space. Whispers of a forbidden romance lingered in the air, as two souls bound by destiny sought solace in each others arms. Amidst the rubble, they found a relic pulsing with the echoes of their eternal embrace, a testament to loves enduring power.',
        ),
        Story(
          iD: 06,
          image: 'images/image07.webp',
          catagory: 'Adventure',
          sname: 'Shadows of Destiny',
          sbody:
              'Beneath a shroud of darkness, whispers of destiny beckoned to those brave enough to heed their call. In the labyrinthine streets of a forgotten city, shadows danced with secrets of past and future. Adventurers ventured forth, seeking to unravel the mysteries that lay hidden in the depths of time. Yet, with every step, they found themselves drawn closer to the shadowy embrace of their own fate.',
        ),
        Story(
          iD: 07,
          image: 'images/image08.jpeg',
          catagory: 'Horror',
          sname: 'Echoes of the Past',
          sbody:
              'Amongst the ancient ruins of a lost civilization, echoes of the past whispered tales of glory and downfall. Explorers delved into the depths of history, seeking to uncover the truths buried beneath layers of time. As they unearthed relics of bygone eras, they felt the weight of the past pressing down upon them, a reminder of the cyclical nature of existence.',
        ),
      ],
    );
  }
}
