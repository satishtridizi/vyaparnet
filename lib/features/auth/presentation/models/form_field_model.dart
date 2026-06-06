class FormFieldModel {
  final String label;
  final String hint;
  final bool isPassword;

  const FormFieldModel({
    required this.label,
    required this.hint,
    this.isPassword = false,
  });
}
