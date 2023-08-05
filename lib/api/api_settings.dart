class ApiSettings {
  //http://demo-api.mr-dev.tech/api/users
  static const String _baseUrl = "http://demo-api.mr-dev.tech/api/";

  static const String users = '${_baseUrl}users';
  static const String login = '${_baseUrl}students/auth/login';
  static const String register = '${_baseUrl}students/auth/register';
  static const String logout = '${_baseUrl}students/auth/logout';
  static const String images = '${_baseUrl}student/images/{id}';
}
