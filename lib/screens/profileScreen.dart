// import 'package:flutter/material.dart';
// import 'package:pawfect/database/database.dart';

// class Pet {
//   final String name;
//   final String species;
//   final String imageUrl;
//   final String owner;
//   final String details;

//   Pet({
//     required this.name,
//     required this.species,
//     required this.imageUrl,
//     required this.owner,
//     required this.details,
//   });
// }

// class PetPlaydateScreen extends StatefulWidget {
//   @override
//   _PetPlaydateScreenState createState() => _PetPlaydateScreenState();
// }

// class _PetPlaydateScreenState extends State<PetPlaydateScreen> {
//   List<Pet> pets = [];

//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch pet data from database when the widget initializes
//     fetchPetData();
//   }

//   void fetchPetData() async {
//     // Assuming fetchPetData() returns a list of pets with required fields
//     List<Pet> fetchedPets = await Database.fetchPetData();
//     setState(() {
//       pets = fetchedPets;
//     });
//   }

//   void _swipeLeft() {
//     setState(() {
//       currentIndex = (currentIndex + 1) % pets.length;
//       if (currentIndex < 0) {
//         currentIndex = pets.length - 1;
//       }
//     });
//   }

//   void _swipeRight() {
//     setState(() {
//       currentIndex = (currentIndex + 1) % pets.length;
//     });

//     _sendNotificationToOwner(pets[currentIndex].owner);
//   }

//   void _sendNotificationToOwner(String owner) {
//     // Implement the logic to send a notification to the owner here
//     print('Notification sent to $owner');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pet Playdate'),
//       ),
//       body: Center(
//         child: pets.isEmpty
//             ? CircularProgressIndicator() // Show loading indicator if pets data is being fetched
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           height: 300,
//                           width: 300,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Image.network(pets[currentIndex].imageUrl),
//                         ),
//                         Positioned(
//                           bottom: 20,
//                           left: 20,
//                           right: 20,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 pets[currentIndex].name,
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 'Species: ${pets[currentIndex].species}',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 'Owner: ${pets[currentIndex].owner}',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 'Details: ${pets[currentIndex].details}',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: _swipeLeft,
//                         child: Text('Swipe Left'),
//                       ),
//                       ElevatedButton(
//                         onPressed: _swipeRight,
//                         child: Text('Swipe Right'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
