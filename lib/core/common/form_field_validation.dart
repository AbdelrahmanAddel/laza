enum TextFormFieldsType { email, password, description, name  ,otp}

String? Function(String?) textFormFieldValidator(TextFormFieldsType field) {
  switch (field) {
    case TextFormFieldsType.email:
      return (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      };

    case TextFormFieldsType.password:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        final hasUpper = value.contains(RegExp(r'[A-Z]'));
        final hasLower = value.contains(RegExp(r'[a-z]'));
        final hasSpecial = value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
        final hasNumber = value.contains(RegExp(r'[0-9]'));
        if (!hasUpper || !hasLower || !hasSpecial || !hasNumber) {
          return 'Password must include upper, lower, and special characters';
        }
        return null;
      };

    case TextFormFieldsType.description:
      return (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Description cannot be empty';
        } else if (value.length < 10) {
          return 'Description must be at least 10 characters';
        }
        return null;
      };

    case TextFormFieldsType.name:
      return (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your name';
        } else if (value.length < 3) {
          return 'Name must be at least 3 characters';
        }
        return null;
      };
    case TextFormFieldsType.otp:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your otp';
        } else if (value.length < 4) {
          return 'Otp must be at least 4 characters';
        }
        return null;
      };
  }
}