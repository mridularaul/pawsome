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
        title: Text('Pet Playdate', style: kText,),
        backgroundColor: yellow,
      ),
      body: Center(
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
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Species: ${pets[currentIndex].species}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Owner: ${pets[currentIndex].owner}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Details: ${pets[currentIndex].details}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
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
                ),
                ElevatedButton(
                  onPressed: _swipeRight,
                  child: Text('Swipe Right'),
                ),
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}