# channels

Challenge: 02-channels
Chapter: 12-channels

Channels are a typed, [thread-safe](https://en.wikipedia.org/wiki/Thread_safety) queue. Channels allow different goroutines to communicate with each other.

## Create a Channel

Like maps and slices, channels must be created *before* use. They can also use teh same `make` keyword.

```go
ch := make(chan int)
```

## Send Data to a Channel

```go
ch <- 69
```

the `<-` is called the *channel operator*. Data flows in the direction of the arrow. This operation will [block](https://en.wikipedia.org/wiki/Blocking_(computing)) until another goroutine is ready to receive the value.

## Receive Data from a Channel

```go
v := <-ch
```

This reads and removes a value from the channel and saves it into teh variable `v`. This operation will *block* until there is a value in the channel to be read.

## Reference Type

Like maps and slices, channels are reference types, meaning they are passed by reference by default.

```go
func send(ch chan int) {
    ch <- 99
}

func main() {
    ch := make(chan int)
    go send(ch)
    fmt.Println(<-ch) // 99
}
```

## Blocking and Deadlocks

A [deadlock](https://yourbasic.org/golang/detect-deadlock/#:~:text=yourbasic.org%2Fgolang,look%20at%20this%20simple%20example.) is when a group of goroutines are all blocking so none of them can continue. This is a common bug you need to watch out for in concurrent programming.

## Assignment

Run the program. You'll see that it deadlocks and never exits. The `sendIsOld` function is trying to send on a channel, but no other goroutines are running that can accept the value *from* the channel.

Fix the deadlock by spawning a goroutine to send the "is old" values.
