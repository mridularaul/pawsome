import 'package:flutter/material.dart';
import 'package:pawfect/utils/constants.dart';
class Pet {
  final String name;
  final String species;
  final String imageUrl;
  final String owner;
  final String details;

  Pet({required this.name, required this.species, required this.imageUrl, required this.owner, required this.details});
}

class PetPlaydateScreen extends StatefulWidget {
  @override
  _PetPlaydateScreenState createState() => _PetPlaydateScreenState();
}

class _PetPlaydateScreenState extends State<PetPlaydateScreen> {
  List<Pet> pets = [
    Pet(
      name: 'Buddy',
      species: 'Dog',
      imageUrl: 'assets/images/Buggs.png',
      owner: 'John Doe',
      details: 'Friendly and playful dog. Enjoys long walks in the park.',
    ),
    Pet(
      name: 'Whiskers',
      species: 'Cat',
      imageUrl: 'assets/images/Bunny.png',
      owner: 'Jane Smith',
      details: 'Independent and affectionate cat. Loves to nap in the sun.',
    ),
    Pet(
      name: 'Nemo',
      species: 'Fish',
      imageUrl: 'assets/images/Cinnamon.png',
      owner: 'Alice Johnson',
      details: 'Colorful and lively fish. Requires a well-maintained aquarium.',
    ),
    // Add more pets as needed
  ];

  int currentIndex = 0;

  void _swipeLeft() {
    setState(() {
      currentIndex = (currentIndex + 1) % pets.length;
      if (currentIndex < 0) {
        currentIndex = pets.length - 1;
      }
    });
  }

  void _swipeRight() {
    setState(() {
      currentIndex = (currentIndex + 1) % pets.length;
    });

    // Simulate sending a notification to the owner when swiping right
    _sendNotificationToOwner(pets[currentIndex].owner);
  }

  void _sendNotificationToOwner(String owner) {
    // Implement the logic to send a notification to the owner here
    print('Notification sent to $owner');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Playdate', style: kText.copyWith(fontSize: 25),),
        backgroundColor: yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(pets[currentIndex].imageUrl),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pets[currentIndex].name,
                    style: kHeading.copyWith(fontSize: 35)
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Species : ${pets[currentIndex].species}',
                    style: kText.copyWith(fontSize: 20)
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Owner : ${pets[currentIndex].owner}',
                    style: kText.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Details : ${pets[currentIndex].details}',
                      style: kText.copyWith(fontSize: 17)
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _swipeLeft,
                    child: Text('Swipe Left'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        elevation: 8,
                        shadowColor: Colors.grey
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _swipeRight,
                    child: Text('Swipe Right'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        elevation: 8,
                        shadowColor: Colors.grey
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}