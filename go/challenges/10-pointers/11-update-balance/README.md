# update balance

Challenge: 11-update-balance
Chapter: 10-pointers

Textio needs a new way to update user's account balance.

## Assignment

Implement the `updateBalance` function. It should take a `customer` pointer and a `transaction`, and return an error. Depending on the `transactionType`, it should either add or subtract the `amount` from the customer's balance. If the customer does not have enough money, it should return the error `insufficient funds`. If the `transactionType` isn't a withdrawal or deposit, it should return the error `unknown transaction type`. Otherwise, it should process the transaction and return `nil`.

```go
alice := customer{id: 1, balance: 100.0}
deposit := transaction{customerID: 1, amount: 50, transactionType: transactionDeposit}

updateBalance(&alice, deposit)
// id: 1 balance: 150
```
