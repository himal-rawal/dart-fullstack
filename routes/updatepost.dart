// ignore_for_file: avoid_dynamic_calls

import 'package:dart_frog/dart_frog.dart';

import '../model/blog_model.dart';
import '../utils/blog_constants.dart';

Future<Response> onRequest(RequestContext context) async {
  //check if the request is a PUT request
  if (context.request.method == HttpMethod.put) {
    //check if headers is application/json
    final contentType = context.request.headers['Content-Type'];
    // If contentType is application/json
    if (contentType == 'application/json') {
      //check if body is present
      final body = await context.request.json() as Map<String, dynamic>;
      final postRequest = BlogPost.fromJson(body);
      // We check for body,id, title and description
      // If they are not null we update blogList
      if (postRequest.id != null &&
          postRequest.title != null &&
          postRequest.description != null) {
        blogList[blogList
            .indexWhere((element) => element.id == postRequest.id)] = BlogPost(
          id: postRequest.id,
          title: postRequest.title,
          description: postRequest.description,
          image: postRequest.image,
        );

        return Response.json(
          statusCode: 201,
          body: {
            'message': ' Blog Post Updated successfully ',
            'data': blogList,
          },
        );
      } else {
        /// If body, title or description is null this error message is sent
        /// as they are required
        return Response.json(
          statusCode: 400,
          body: {'message': 'title and description are required'},
        );
      }
    }

    /// If contentType is not application/json this error message is sent
    return Response.json(
      statusCode: 404,
      body: {'message': 'Content-Type must be application/json'},
    );
  }

  // If user sent request other than PUT this error message is sent
  return Response.json(
    statusCode: 404,
    body: {'message': 'Method not allowed'},
  );
}
