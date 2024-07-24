# Dart Fullstack

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

An example application built with dart_frog and flutter .
In this example I have demonstrated how to perform crud operations in dartfrog,handle cors, add middleware, and integrate those operations in flutter.

### Steps to run project
- Clone Repo
- Enter in terminal
 ` dart pub global activate dart_frog_cli`
- `dart_frog dev`
- now  go to blogui directory ad run
 `flutter run -d chrome`

### Apis

- Get all posts 
`Method : GET http://localhost:8080/getposts `
- Create posts
`Method: POST http://localhost:8080/createposts`
- Delete Post
`Method: DELETE http://localhost:8080/deleteposts`
- Update post
`Method: PUT http://localhost:8080/deleteposts`


[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
