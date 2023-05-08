enum Roles {
  roleAdmin,
  roleUser,
}

extension RolesString on Roles {
  String? get names {
    switch (this) {
      case Roles.roleAdmin:
        return "ROLE_ADMIN";
      case Roles.roleUser:
        return "ROLE_USER";
      default:
    }
    return null;
  }
}
