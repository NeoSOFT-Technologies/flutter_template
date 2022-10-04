enum LocationPermissions {
  /// Permission to access the requested feature is granted by the user.
  ALLOWED,

  /// Permission to access the requested feature is denied by the user.
  DENIED,

  /// Permission to access the requested feature is denied by the user.
  DENIED_FOREVER,
  SERVICE_DISABLED,
  NONE,

  /// Permission status if service is unable to determine.
  UNABLE_TO_DETERMINE
}