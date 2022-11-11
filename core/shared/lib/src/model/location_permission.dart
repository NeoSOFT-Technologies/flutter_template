enum LocationPermissions {
  /// Permission to access the requested feature is granted by the user.
  allowed,

  /// Permission to access the requested feature is denied by the user.
  denied,

  /// Permission to access the requested feature is denied by the user.
  deniedForever,
  serviceDisabled,
  none,

  /// Permission status if service is unable to determine.
  unableToDetermine
}