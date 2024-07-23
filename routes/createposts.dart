// ignore_for_file: avoid_dynamic_calls

import 'package:dart_frog/dart_frog.dart';

import '../model/blog_model.dart';
import '../utils/blog_constants.dart';

Future<Response> onRequest(RequestContext context) async {
  //check if the request is a POST request
  if (context.request.method == HttpMethod.post) {
    //check if headers is application/json
    final contentType = context.request.headers['Content-Type'];
    // If contentType is application/json
    if (contentType == 'application/json') {
      //check if body is present
      final body = await context.request.json() as Map<String, dynamic>;
      final postRequest = BlogPost.fromJson(body);
      // We check for title and description
      // If they are not null we add them to blogList
      if (postRequest.title != null && postRequest.description != null) {
        blogList.add(
          BlogPost(
            id: '${int.parse(blogList.last.id ?? "0") + 1}',
            title: postRequest.title,
            description: postRequest.title,
            image: postRequest.image,
          ),
        );
        return Response.json(
          statusCode: 201,
          body: {
            'message': ' Blog Post created successfully ',
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

  // If user sent request other than POST this error message is sent
  return Response.json(
    statusCode: 404,
    body: {'message': 'Method not allowed'},
  );
}
