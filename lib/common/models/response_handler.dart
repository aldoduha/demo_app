abstract class ResponseHandler<T> {

  T doTransform(Map<String, dynamic> json);

}