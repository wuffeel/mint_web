import 'bootstrap.dart';
import 'injector/injector.dart';
import 'presentation/app/view/app.dart';

void main() {
  configureDependencies();
  bootstrap(App.new);
}
