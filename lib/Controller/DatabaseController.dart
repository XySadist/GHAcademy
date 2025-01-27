import 'package:appwrite/appwrite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './ClientController.dart';
import 'package:project_mobile/View/HomePage/HomePage.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  Future storeUserData(String username, String dob, String country,
      String email, String phone, String gender, String dance) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      Map<String, dynamic> userData = {
        'username': username,
        'Date_of_Birth': dob,
        'Country': country,
        'Email': email,
        'Phone': phone,
        'Gender': gender,
        'dance': dance
      };

      try {
        await databases!.createDocument(
          databaseId: "6562fc4e11f2e3d3642d",
          documentId: user.uid,
          collectionId: "6562fc6ea4c319be657e",
          data: userData,
          permissions: [
            Permission.read(Role.any()),
            Permission.update(Role.any()),
            Permission.delete(Role.any()),
          ],
        );
        print("DatabaseController:: storeUserData - Data stored successfully");
        Get.to(() => HomePage());
      } catch (error) {
        Get.defaultDialog(
          title: "Error Database",
          titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
          titleStyle: Get.context?.theme.textTheme.titleLarge,
          content: Text(
            "$error",
            style: Get.context?.theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
        );
      }
    } else {
      // Jika pengguna belum masuk, tampilkan pesan atau arahkan mereka untuk masuk
      print("User is not logged in");
      // Contoh tampilkan pesan:
      Get.snackbar('Error', 'You need to log in to perform this action');
    }
  }

  Future updateUserData(String username, String dob, String country,
      String email, String phone, String gender, String dance) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      Map<String, dynamic> userData = {
        'username': username,
        'Date_of_Birth': dob,
        'Country': country,
        'Email': email,
        'Phone': phone,
        'Gender': gender,
        'dance': dance
      };

      try {
        await databases!.updateDocument(
          databaseId: "6562fc4e11f2e3d3642d",
          documentId: user.uid,
          collectionId: "6562fc6ea4c319be657e",
          data: userData,
        );
        print(
            "DatabaseController:: updateUserData - Data updated successfully");
        Get.to(() => HomePage());
      } catch (error) {
        Get.defaultDialog(
          title: "Error Database",
          titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
          titleStyle: Get.context?.theme.textTheme.titleLarge,
          content: Text(
            "$error",
            style: Get.context?.theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
        );
      }
    } else {
      // Jika pengguna belum masuk, tampilkan pesan atau arahkan mereka untuk masuk
      print("User is not logged in");
      // Contoh tampilkan pesan:
      Get.snackbar('Error', 'You need to log in to perform this action');
    }
  }

  Future<Map<String, dynamic>?> getStoreUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String documentId = user.uid; // Gunakan UID pengguna sebagai ID dokumen

      Map<String, dynamic>? userData;
      try {
        final response = await databases!.getDocument(
          databaseId: "6562fc4e11f2e3d3642d",
          collectionId: "6562fc6ea4c319be657e",
          documentId: documentId,
        );

        if (response.data != null) {
          userData = response.data;
        }
      } catch (error) {
        print("Error fetching user data: $error");
        // Handle error using GetX dialog or snackbar
      }
      return userData;
    } else {
      print("User is not logged in");
      // Handle case where the user is not logged in
      // Show appropriate message to log in
      return null;
    }
  }

  Future Message(String name, String message) async {
    Map<String, dynamic> jadwalData = {
      'name': name,
      'message': message,
    };
    print(name);
    print(message);
    try {
      await databases!.createDocument(
        databaseId: "6562fc4e11f2e3d3642d",
        documentId: ID.unique(),
        collectionId: "6569df9e8bd9dd69415b",
        data: jadwalData,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );

      print("DatabaseController:: storeUserData - Data stored successfully");
      Get.defaultDialog(
          title: "Succes",
          titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
          titleStyle: Get.context?.theme.textTheme.titleLarge,
          content: Text(
            "your masssage was succesfully sent!",
            style: Get.context?.theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ));
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<void> updateMessage(
      String documentId, Map<String, dynamic> updatedData) async {
    try {
      await databases!.updateDocument(
        databaseId: "6562fc4e11f2e3d3642d",
        collectionId: "6569df9e8bd9dd69415b",
        documentId: documentId,
        data: updatedData,
      );
      print("DatabaseController:: updateMessage - Data updated successfully");
    } catch (error) {
      print("Error updating message: $error");
    }
  }

  Future<void> deleteMessage(String documentId) async {
    try {
      await databases!.deleteDocument(
        databaseId: "6562fc4e11f2e3d3642d",
        collectionId: "6569df9e8bd9dd69415b",
        documentId: documentId,
      );
      print("DatabaseController:: deleteMessage - Data deleted successfully");
    } catch (error) {
      print("Error deleting message: $error");
    }
  }

  Rx<List<Map<String, dynamic>>> messages = Rx<List<Map<String, dynamic>>>([]);

  // Fungsi untuk mengambil pesan dari database
  Future<void> getMessages() async {
    try {
      // Ganti dengan kode untuk mengambil data pesan dari database
      // Contoh pengambilan data dari database
      final response = await databases!.listDocuments(
        databaseId: "6562fc4e11f2e3d3642d",
        collectionId: "6569df9e8bd9dd69415b",
      );

      // ignore: unnecessary_null_comparison
      if (response.documents != null) {
        List<Map<String, dynamic>> convertedMessages =
            response.documents.map((document) => document.data).toList();
        messages.value = convertedMessages;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
