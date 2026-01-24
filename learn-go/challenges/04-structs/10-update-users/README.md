# Update Users

Challenge: 09-update-users
Chapter: 04-structs

We need a way to differentiate between standard and premium users. When a new user is created, they need a membership tpye, and that type will determine the message character limit.

## Assignment

1. Create a new struct called `Membership`, it should have:
    - [ ] A `Type` string field
    - [ ] A `MessageCharLimit` integer field
2. Update the `User` struct to [embed](https://gobyexample.com/struct-embedding) a `Membership`
3. Complete the `newUser` function. It should return a new `User` with all the fields set as you would expect based on the inputs. If the user is a `"premium"` member, the `MessageChrLimit` should be `1000`, otherwise, it should only be `100`.
