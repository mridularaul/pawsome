import 'package:cloud_firestore/cloud_firestore.dart';

class AdoptionMethods{
  Future<Stream<QuerySnapshot>> getAdoptiondetails() async {
    return await FirebaseFirestore.instance.collection('Adoption').snapshots();
  }
}

class PetProfileMethods{
  Future addPetDetails(
      Map<String, dynamic> petinfo) async {
    //return await FirebaseFirestore.instance
    return await FirebaseFirestore.instance.collection('PetProfile').add(petinfo);
  }
  /*
  pet name
  breed
  gender
  age
  color
  height
  weight
  owner name
  owner email
  id = owneremail+pet name waiting....
  */



  Future <Stream<QuerySnapshot>> getPetDetails() async{
    return await FirebaseFirestore.instance.collection('PetProfile').snapshots();
  }

  Future deletePetDetails(String id) async {
    return await FirebaseFirestore.instance.collection('PetProfile').doc(id).delete();
  }

}

class UserProfileMethods{
  Future addUserDetails(
      Map<String, dynamic> Userinfo) async {
    //return await FirebaseFirestore.instance
    return await FirebaseFirestore.instance.collection('UserProfile').add(Userinfo);
  }

  Future <Stream<QuerySnapshot>> getUserDetails() async{
    return await FirebaseFirestore.instance.collection('UserProfile').snapshots();
  }

  Future deleteUserDetails(String id) async {
    return await FirebaseFirestore.instance.collection('UserProfile').doc(id).delete();
  }

}

//From here
class AppointmentMethods{
  Future addappointmentDetails(
      Map<String, dynamic> appointmentinfo) async {
    //return await FirebaseFirestore.instance
    return await FirebaseFirestore.instance.collection('Appointment').add(appointmentinfo);
  }

  Future <Stream<QuerySnapshot>> getappointmentDetails() async{
    return await FirebaseFirestore.instance.collection('Appointment').snapshots();
  }

  Future deleteappointmentDetails(String id) async {
    return await FirebaseFirestore.instance.collection('Appointment').doc(id).delete();
  }

}
