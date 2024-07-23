import 'package:dart_frog/dart_frog.dart';

import '../model/blog_model.dart';
import '../utils/blog_constants.dart';

Response onRequest(RequestContext context) {
  //check if the request is a GET request
  if (context.request.method == HttpMethod.get) {
    //check if query parameter is present
    final params = context.request.uri.queryParameters;

    // Check if query parmeter contains id
    if (params.containsKey('id')) {
      final id = params['id'];
      // Get blog post by id and assign to a variable blogPost.
      // If id donot match we assign empty json
      final blogPost = blogList.firstWhere(
        (element) => element.id == id,
        orElse: () => BlogPost.fromJson({}),
      );

      // Checks if blogpost id is not null
      if (blogPost.id != null) {
        return Response.json(body: {'data': blogPost});
      }
      // If blogpost id is null this error message is sent
      return Response.json(
        statusCode: 404,
        body: {'message': 'Blog not found'},
      );
    }

    /// If query parameter is not present whole blog list is sent
    return Response.json(body: {'data': blogList});
  }

  // If user sent request other than GET this error message is sent
  return Response.json(
    statusCode: 405,
    body: {'message': 'Method not allowed'},
  );
}
