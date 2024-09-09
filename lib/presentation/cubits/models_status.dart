abstract class ModelStatus<T extends Object> {
  final T? item;
  final String? message;

  const ModelStatus({this.item, this.message});
}

class IdleStatus<T extends Object> extends ModelStatus<T> {
  const IdleStatus();
}

class LoadingStatus<T extends Object> extends ModelStatus<T> {
  const LoadingStatus();
}

class LoadedStatus<T extends Object> extends ModelStatus<T> {
  LoadedStatus(T? item) : super(item: item);
}

class FailedStatus<T extends Object> extends ModelStatus<T> {
  FailedStatus(String? message) : super(message: message);
}
