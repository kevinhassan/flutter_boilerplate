String rawValue(dynamic enumeration) {
  final String value = enumeration != null
      ? enumeration.toString().split(".")[1].toLowerCase()
      : "";
  return value.isNotEmpty
      ? "${value[0].toUpperCase()}${value.substring(1)}"
      : "";
}
