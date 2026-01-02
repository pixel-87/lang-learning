# password strength

Challenge: 18-password-strength
Chapter: 08-slices

As part of improving security, Textio wants to enforce a new password policy, A valid password must meet the following criteria:

- At least 5 characters long but no more than 12 characters.
- Contains at least one uppercase letter.
- Contains at least one digit.

> [!TIP]
> A string is really just [a read-only slice of bytes](https://go.dev/blog/strings). This means that you can use the same techniques you learned in the previous lessson to iterate over the characters of a string.

## Assignment

Implement the `isValidPassword` function by looping through each character in the password string. Make sure the password is long enough and includes at least one uppercase letter and one digit.

Assume passwords consist of [ASCII characters](https://en.wikipedia.org/wiki/ASCII#Printable_character_table) only.

## Tip

Remember that characters in [Go strings](https://go.dev/blog/strings) are really just bytes under the hood. You can compare a character to another character like 'A' or 'O' to check if it falls within a certain range.
