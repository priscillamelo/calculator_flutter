// ignore_for_file: constant_identifier_names

class MemoryCalculator {
  static const String ADD = '+';
  static const String SUBTRACT = '-';
  static const String MULTIPLY = 'x';
  static const String DIVIDE = '/';
  static const String PERCENTAGE = '%';
  static const String EQUAL = '=';

  static const String LISTOPERATORS =
      ADD + SUBTRACT + MULTIPLY + DIVIDE + PERCENTAGE + EQUAL;

  String _valueDisplay = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operator = '';
  bool _wipeValue = false;
  late String _lastDigit;

  void applyCommand(String valueButton) {
    if (_isReplacingOperator(valueButton)) {
      _operator = valueButton;
      return;
    }

    if (valueButton == 'AC') {
      _displayClear();
    } else if (LISTOPERATORS.contains(valueButton)) {
      _setOperator(valueButton);
    } else {
      _addDigit(valueButton);
    }

    _lastDigit = valueButton;
  }

  _isReplacingOperator(String lastCommand) {
    return (LISTOPERATORS.contains(lastCommand) &&
            LISTOPERATORS.contains(_lastDigit)) &&
        (_lastDigit != '=' && lastCommand != '=');
  }

  String get valueDisplay {
    return _valueDisplay;
  }

  _displayClear() {
    _valueDisplay = '0';
    _buffer.indexed;
    //_buffer = [0.0, 0.0];
    _bufferIndex = 0;
    _operator = '';
    _wipeValue = false;
  }

  _setOperator(String operator) {
    bool isEqualSign = operator == '=';
    if (_bufferIndex == 0 && !isEqualSign) {
      _operator = operator;
      _bufferIndex = 1;
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0;
      _valueDisplay = _buffer[0].toString();
      _valueDisplay = _valueDisplay.endsWith('.0')
          ? _valueDisplay.split('.')[0]
          : _valueDisplay;
      _operator = isEqualSign ? '=' : operator;
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    _wipeValue = true;
  }

  _addDigit(String digit) {
    bool isDot = digit == '.';
    bool hasDot = _valueDisplay.contains('.');

    bool emptyDisplay = (_valueDisplay == '0' && !isDot) || _wipeValue;
    if (isDot && hasDot && !emptyDisplay) {
      return;
    }

    String emptyValue = isDot ? '0' : '';
    String currentValue = emptyDisplay ? emptyValue : _valueDisplay;
    _valueDisplay = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_valueDisplay) ?? 0;

    print(_buffer);
  }

  _calculate() {
    switch (_operator) {
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case '%':
        return _buffer[0] % _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
