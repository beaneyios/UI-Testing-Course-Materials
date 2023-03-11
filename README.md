<img src="https://user-images.githubusercontent.com/37811466/224490695-8cc8a230-4ebc-4770-987a-b5e87b9061c3.png" width="300" height="300">

# Real-world iOS UI testing

## Why this course?
The iOS world is currently replete with courses. Among these are plenty of articles introducing developers to unit and UI testing on iOS.

There's very little around when it comes to advancing beyond that. Actually putting together a real-world UI testing suite amounts to piecing together articles, third party libraries and sometimes even guess-work, and even then you're left with a suite that fails every third run for no apparent reason.

It's also quite a laborious task to navigate through views and make assertions.

So that's what this course aims to address.

## This course is open source!
It's been my view from the start that there is no "right way" to approach UI testing on iOS, mostly because Apple have massively neglected the tools they offer.

This course is the result of my attempt to add "a way" to do it.

If you see anything you think could be changed/added in this course, submit a GitHub issue and if I think it makes sense to include, you'll be credited as a co-author wherever the course ends up mentioned.

## Who is this for?
Something I should say up front - this is not for beginners. I will spend very little time talking about the production code in the project. I'll only be touching that code when it's relevant to writing a UI test. You will ideally have a reasonably firm grasp of core iOS concepts and git before starting this course.

## How do you use this course?
Rather than wrap the content of this course up in a PDF, I've decided to stick to GitHub. Head over to the [Pull Requests](https://github.com/beaneyios/UI-Testing-Course-Materials/pulls) tab on this repo and you'll see a list of chapters. Each pull request will contain the chapter in its completed state, along with a description that acts like a tutorial. So if you want to follow along and code it yourself, pull the previous chapter in git and follow the tutorial.

For example, if you want to follow the tutorial for Chapter 8 and code it yourself, you'd pull `advanced/7-mocking-websockets-pt1` as your starting point. And if you want to see the finished code for Chapter 8, you'd pull `advanced/8-mocking-websockets-pt2`. 

## Chapters
### Chapter 1 - Getting started with UI tests
- Learn to expose your views to XCUITests with `accessibilityIdentifier`s.
- Write a simple (but messy) series of UI tests for your views using XCUI.

### Chapter 2 - Tidying up
- Breaking out your tests into `Screens`, that allow re-usable interaction with your app.

### Chapter 3 - Fixing flakiness pt1.
- Introduces the concept of augmenting production code when in "UI test mode", in order to reduce flakiness on tests.
- Switching off animations to reduce wait time.

### Chapter 4 - Fixing flakiness pt2.
- Introduces method for stubbing the network in UI tests.
- Makes use of a library called [Shock](https://github.com/justeat/Shock)

### Chapter 5 - Fixing flakiness final part
- Tidies up the previous chapter, moving all mocking code into a super class so we can change it easily if needed.

### Chapter 6 - Snapshots
- Makes use of [FBSnapshot](https://github.com/uber/ios-snapshot-test-case) to reduce dependance on laborious XCAssertions

### Chapter 7 - Mocking websockets pt1
- Replaces Shock with a custom made, light weight, node server.

### Chapter 8 - Mocking websockets pt2
- Makes use of new node server to receive requests from the test target to push websocket messages to the main app
- Implements socketio in the main app.
- Writes a snapshot test, using the node server, to test the new websocket implementation.
