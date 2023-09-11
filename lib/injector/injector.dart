import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_module.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [ExternalModule(MintCorePackageModule)],
)
void configureDependencies() => getIt.init(environment: web.name);
