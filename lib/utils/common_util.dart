/*
 * 是否为null
 */
bool isNull(value) {
  if (value == null) {
    return true;
  } else {
    return false;
  }
}

/*
 * 非空值
 */
T noNullValue<T>(T value, T defaultValue) {
  if (value != null) {
    return value;
  } else {
    return defaultValue;
  }
}
