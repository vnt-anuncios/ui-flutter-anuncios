abstract class State {
  static const SUBMIT = true;
  static const LOADING = true;
  static const ERROR = true;
  static const LOADED = true;
}

enum Status {
  wait, //loading -> wait the progress
  error, //error -> write error of the connection
  ok, //ok -> connection remote successfull
  none, //isempty
}
