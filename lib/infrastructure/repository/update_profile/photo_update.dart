import 'dart:io';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; // for basename

class UserProfileUpdateRepo {
  // final String accessToken;

  Future<void> uploadProfilePic(File file) async {
    final url = Uri.parse('${Apis.baseUrl}/user/profile-pic');

    var request = http.MultipartRequest('PUT', url);

    // Add headers
    request.headers.addAll({
      'Authorization': 'Bearer $accesstocken',
      'Content-Type': 'multipart/form-data',
    });

    // Add file
    var stream = http.ByteStream(file.openRead());
    var length = await file.length();
    var multipartFile = http.MultipartFile('profilePic', stream, length,
        filename: basename(file.path));

    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      print('Profile picture uploaded successfully: $responseData');
    } else {
      var responseData = await response.stream.bytesToString();
      print(
          'Failed to upload profile picture: ${response.statusCode}, $responseData');
    }
  }
}
