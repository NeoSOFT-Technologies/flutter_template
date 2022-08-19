## Dependency Management

This project uses construction-based dependency injection. This means that all the classes will receive their dependencies as parameters of their constructor.

```dart
class GetUserByIdUseCase {
  final UserRepository userRepository;

  GetUserByIdUseCase(this.userRepository); // Dependencies injected by constructor

  @override
  Stream<User> call(String userId) {
    return userRepository.getUserById(userId);
  }
}
```

To satisfy these dependencies each package with concrete implementations will expose a file called `dependency_configurator.dart` with an implementation of an interface called [DependencyConfigurator](https://github.com/StuartApp/flutter-modular-architecture/blob/main/packages/shared/all/core/lib/src/dependencies/dependency_configurator.dart). This interface defines a method that must be implemented and it receives a `GetIt` instance that can be used to register all the dependencies that are provided by the package. [GetIt](https://pub.dev/packages/get_it) is simple but powerful service locator, but if you want you can use any other tool with this architecture. `DependencyConfigurator` also receives a `DependencyConfiguratorContext` instance with extra configuration info.

```dart
// dependency_configuration_context.dart
class DependencyConfigurationContext {
  final String apiBaseUrl;

  ConfigurationContext({
    required this.apiBaseUrl,
  });
}

// dependency_configurator.dart
abstract class DependencyConfigurator {
  void configureDependencies(
    DependencyConfiguratorContext context,
    GetIt getIt,
  );
}
```

Then these `dependency_configurator.dart` can be used from a main module to register all the different dependencies. For instance from main method we can call the following `configureDependencies()` method:

```dart
// dependencies.dart
final configurators = [
  ThemesDependencyConfigurator(),
  DomainDependencyConfigurator(),
];

Future configureDependencies(DependencyConfigurationContext context) async{
  for (var configurator in configurators) {
    await configurator.configureDependencies(context, GetIt.instance);
  }
}
```



## Dependency Injection

Dependency injection is necessary if you're not coding spaghetti 🍝 and you want to keep nice layers of separation in your Flutter app's codebase. The problem is that all of the libraries out there, such as **get_it** or **kiwi**, are just service locators with no support or a [limited support](https://resocoder.com/2019/11/25/flutter-generated-dependency-injection-kiwi-tutorial/) for automating the registration of dependencies.

Dagger solves it elegantly for native Android and Angular is also known for its powerful dependency injection framework. Now, we Flutter developers can finally use something similar - the [injectable package](https://pub.dev/packages/injectable) which is a code generator for **get_it**.

## Why use GetIt and Injectable?

GetIt is a service locator that allows you to create interfaces and their implementations, and access those implementations globally, anywhere in your app. Injectable generates code that we would have otherwise written by using annotations. This allows us to worry more about logic and less about how we are going to access it.

## Installation 

```yaml
dependencies:  
  dependency_injection:
    path: ../dependency-injection/
  
dev_dependencies:  
  # add the generator to your dev_dependencies  
  injectable_generator:  
  # add build runner if not already added  
  build_runner: 
```

1. Define a top-level function (lets call it `_configureModuleDependencies`) then annotate it with `@injectableInit`.
2. Call the **Generated** func $initGetIt(), or your custom initilizer name inside your configure func and pass in the getIt instance.

```dart
//global private function
@InjectableInit(initializerName: r'$initDatabaseGetIt')
_configureModuleDependencies(GetIt getIt) => $initDatabaseGetIt(getIt);

//module dependency configurator
class DatabaseDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt)); // wrap in future value
  }
}
```

```dart
final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: r'$initGetIt', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() => $initGetIt(getIt);  
```

Note: you can tell injectable what directories to generate for using the `generateForDir` property inside of `@injectableInit`.

The following example will only process files inside of the test folder.

```dart
@InjectableInit(generateForDir: ['test'])  
void configureDependencies() => $initGetIt(getIt);  
```

We make sure we call configureDependencies() in your main func before running the App.

More details for understanding Injectable package can be found here,

* https://pub.dev/packages/injectable
* https://blog.logrocket.com/dependency-injection-flutter-using-getit-injectable/
* https://resocoder.com/2020/02/04/injectable-flutter-dart-equivalent-to-dagger-angular-dependency-injection/
