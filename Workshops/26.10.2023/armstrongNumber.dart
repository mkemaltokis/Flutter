void main() {
  int lowerLimit = 1;
  int upperLimit = 1000; // Enter a value limit

  for (int number = lowerLimit; number <= upperLimit; number++) {
    if (isArmstrong(number)) {
      print(number);
    }
  }
}

bool isArmstrong(int number) {
  int originalNumber = number;
  int result = 0;

  while (number > 0) {
    int digit = number % 10;
    result += digit * digit * digit;
    number ~/= 10;
  }

  return originalNumber == result;
}