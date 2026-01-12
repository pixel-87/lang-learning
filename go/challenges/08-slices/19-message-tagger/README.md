# message tagger

Challenge: 19-message-tagger
Chapter: 08-slices

Textio needs a way to tag messages based on specific criteria.

## Assignment

1. - [ ] Complete the `tagMessages` function. It should take a slice of `sms` messages, and a function (that takes an `sms` as input and returns a slice of strings) as inputs. And it should return a slice of `sms` messages.
    - [ ] It should loop through each message and set the `tags` to the result of the passed in function.
    - [ ] Be sure to modify the messages of the original slice using the bracket notation `messages[i]`.
    - [ ] Ensure the tags field contains an initialised slice. No nil slices.

2. - [ ] Complete the `tagger` function. It should take an sms message return a slice of strings.
    - [ ] For any message that contains "urgent" (regardless of casing) in the content, the `Urgent` tag should be applied first.
    - [ ] For any message that contains "sale" (regardless of casing), the `Promo` tag should be applied second.

> [!TIP]
> Regardless of casing just means that even "uRGent" or "SALE" should trigger the tag.

Example usage:

```go
messages := []sms{
	{id: "001", content: "Urgent! Last chance to see!"},
	{id: "002", content: "Big sale on all items!"},
	// Additional messages...
}
taggedMessages := tagMessages(messages, tagger)
// `taggedMessages` will now have tags based on the content.
// 001 = [Urgent]
// 002 = [Promo]
```

## Tip

The go `strings` package, spefically the [`Contains`](https://pkg.go.dev/strings#Contains) and [`ToLower`](https://pkg.go.dev/strings#ToLower) functions, can be very helpful here!

