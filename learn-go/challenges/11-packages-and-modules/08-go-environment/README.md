# go environment

Challenge: 08-go-environment
Chapter: 11-packages-and-modules

Let's clear up a few points before you start writing Go locally.

## Directory Structure

To recap how packages and modules work in your project directory structure:

- You will have many git repositories on your machine (usually one per project).
- Each repository is typically a single module.
- Each module contains one or more *packages*.
- Each package consists of one or more *Go source files* in a single directory.

The path to a package's directory determines its *import path* and where it can be downloaded from if you decide to host it on a remote version control system like github or gitlab.

## A Note About GOPATH

The `$GOPATH` environment variable will be set by default somehwere on your machine (typically in the home directory, `~/go`). Since we will be working in the new "Go modules" setup, you *don't need to worry about that*. If you read something online about setting up a `$GOPATH` its probably outdated.

These days you should avoid working in the `$GOPATH/src` directory. Again that's the old way of doing things and can cause unexpected issues and its better to just avoid it.

## Get Into Your Workspace

Navigate to a location on your machine where you want to store some code. For example, I store all my code in `~/workspace`, then organize it into subfolders based on the remote location. For example:

`~/workspace/github.com/wagslane/go-password-validator` = [https://github.com/wagslane/go-password-validator](https://github.com/wagslane/go-password-validator)

That said, you can put your code wherever you want.

## Question 1

Do you need to puth your code inside of your GOPATH?

## Answer 1

- [ ] Yes
- [x] No, you shouldn't
- [ ] It doesnt matter
