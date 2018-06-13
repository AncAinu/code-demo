# Code Demo

## Technical choices

### Interface builder

The project won't use interface builder, that's a subject for debate, albeit the personal preference, it is rather easier to show skills through code which will appear on git than in IB.

### Tests

Since it is often ask to show TDD knowledge, the project will be done in a TDD way. Nevertheless, writing testable code is probably more important than writing tests. Writing testable code often ensure most of SOLID principles, hence code stability, cleaness and maintenability, whereas tests alone mostly protect against regressions.

#### Testing models

When testing models, we do tests the decoding of the data as given in the data contract of the api. We do not search to test "what if the price was a number and not a string?" because it is the responsability of the api to ensure they respect the contract they give.
But we do test that we obtain the object we need throughout the app, while that object may be different both in form and type from what the api gives [see architecture > model > entities]

## Architecture

The project use MVVM, as it is a nice mix between speed, testability, cleaness and popularity.
MVC is often messy (but also misunderstood by 90% of developers) and VIPER is too much boilerplate for such a small project.

### Models

#### Entities

Entities are simple structures that holds data, they hold very little logic, but still fulfill one purpose, they shield the codebase from changes from the api. If the api gives a specific format of data, often it doesn't fit the needs of the client, simply because APIs are rarely client-specific. It is then better to keep those differences at bay, the sooner you identify them, the less likely they will invade the codebase. This is why it should be done right in the model itself.

### Dependencies

The project use cocoapods as a dependency manager, for the purpose of this project, because it is the most used.

#### Alamofire

Most used swift network layer. It seems rather too much boilerplate to rewrite the network layer entirely especially for a small project.

#### SnapKit

SnapKit is an Auto Layout DSL that facilitate and shorten the use of AutoLayout programmatically.

## Source control

The project use Git, with a git-flow method. Although, git-flow isn't very useful in a single man project, having at least the branches master / develop separated is of good practice.

Pods are commited with the source, as a practice of safe keeping, anyone cloning the source should be able to run the code straight away without extra setup involved.
