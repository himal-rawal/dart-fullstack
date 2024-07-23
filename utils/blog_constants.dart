import '../model/blog_model.dart';

List<BlogPost> blogList = [
  BlogPost.fromJson(
    {
      'id': '1',
      'title': 'Guns',
      'description': 'Guns are dangerous',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/4f/SIG_Pro_by_Augustas_Didzgalvis.jpg',
    },
  ),
  BlogPost.fromJson(
    {
      'id': '2',
      'title': 'Rifles',
      'description': 'Rifles are dangerous',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/4f/SIG_Pro_by_Augustas_Didzgalvis.jpg',
    },
  ),
];
