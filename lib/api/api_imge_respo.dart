class ApiImageResponse <T>{
  final bool success;
  final String message;
   T? object;

  ApiImageResponse( {
    required this.message,
    required this.success,
    this.object,

  } );
}
