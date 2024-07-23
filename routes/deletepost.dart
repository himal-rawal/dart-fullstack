import 'package:dart_frog/dart_frog.dart';

import '../utils/blog_constants.dart';

Response onRequest(RequestContext context) {
  //check if the request is a GET request
  if (context.request.method == HttpMethod.delete) {
    //check if query parameter is present
    final params = context.request.uri.queryParameters;

    // Check if query parmeter contains id
    if (params.containsKey('id')) {
      final id = params['id'];
      // Get blog post by id and assign to a variable blogPost.
      // If id donot match we assign empty json
      print(blogList.any((element) => element.id == id));
      if (blogList.any((element) => element.id == id)) {
        blogList.removeWhere((element) => element.id == id);
        return Response.json(
          statusCode: 201,
          body: {'message': 'Blog deleted Sucessfully'},
        );
      }
      return Response.json(
        statusCode: 404,
        body: {'message': 'Blog not found'},
      );
    }
    // If id is not present this error message is sent
    return Response.json(
      statusCode: 400,
      body: {'message': 'id is required'},
    );
  }
  // If user sent request other than GET this error message is sent
  return Response.json(
    statusCode: 405,
    body: {'message': 'Method not allowed'},
  );
}
