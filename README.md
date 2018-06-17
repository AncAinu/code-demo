# Code Demo


master: [![Build Status - master](https://www.bitrise.io/app/7b269aa72022b1dc/status.svg?token=SwfREuqPfW8WTjMMiXStPw&branch=master)](https://www.bitrise.io/app/7b269aa72022b1dc) | develop: [![Build Status - develop](https://www.bitrise.io/app/7b269aa72022b1dc/status.svg?token=SwfREuqPfW8WTjMMiXStPw&branch=develop)](https://www.bitrise.io/app/7b269aa72022b1dc)

## Technical choices

### Interface builder

The project won't use interface builder, that's a subject for debate, albeit the personal preference, it is rather easier to show skills through code which will appear on git than in IB.

### Tests

Since it is often ask to show TDD knowledge, the project will be done in a TDD way. Nevertheless, writing testable code is probably more important than writing tests. Writing testable code often ensure most of SOLID principles, hence code stability, cleaness and maintenability, whereas tests alone mostly protect against regressions.

#### Testing models

When testing models, we do tests the decoding of the data as given in the data contract of the api. We do not search to test "what if the price was a number and not a string?" because it is the responsability of the api to ensure they respect the contract they give.
But we do test that we obtain the object we need throughout the app, while that object may be different both in form and type from what the api gives [see architecture > model > entities]

#### Testing views

When it come to views, unit testing will only test the logic of the view, not the way it displays (UI tests or snapshot tests are more useful in that case). The idea is that any view should be populated exclusively by a viewModel, which represents the data contract that view have to be used. We do not declare components inside views (labels, buttons...) as private so that we can test them later, but they shouldn't be used directly by other views.

## Architecture

The project use MVVM, as it is a nice mix between speed, testability, cleaness and popularity.
MVC is often messy (but also misunderstood by 90% of developers) and VIPER is too much boilerplate for such a small project.

### Models

#### Entities

Entities are simple structures that holds data, they hold very little logic, but still fulfill one purpose, they shield the codebase from changes from the api. If the api gives a specific format of data, often it doesn't fit the needs of the client, simply because APIs are rarely client-specific. It is then better to keep those differences at bay, the sooner you identify them, the less likely they will invade the codebase. This is why it should be done right in the model itself.

#### Services

Services holds the core logic of the app, while viewmodels holds the logic of display, services are on a higher level and should be reusable by many different viewmodels.
DataService is the best example, we could have viewmodels using an ApiService directly but then we keep the data on a per-viewmodel basis, hindering the ability to share data accross the app.

### Bindings

Reached a certain point, we want to retain data into services. The problem we face is that, if service retain data which are used by many clients (viewmodels), then they [the clients] need to get notified that the data was updated. There is many reasons which make closures, kvo or notifications bad design, and reactive frameworks a good solution, although, since we do not want to bring "too much" to that code demo (and most reactive frameworks are easily too much), we'll use a small class `Dynamic` which copy some basic principles of reactive programming and can be easily understood by anyone. It just makes us able to attach listeners to the variable changes.

### Dependencies

The project use cocoapods as a dependency manager, for the purpose of this project, because it is the most used.

#### Alamofire

Most used swift network layer. It seems rather too much boilerplate to rewrite the network layer entirely especially for a small project.

#### SnapKit

SnapKit is an Auto Layout DSL that facilitate and shorten the use of AutoLayout programmatically.

## Source control

The project use Git, with a git-flow method. Although, git-flow isn't very useful in a single man project, having at least the branches master / develop separated is of good practice.

Pods are commited with the source, as a practice of safe keeping, anyone cloning the source should be able to run the code straight away without extra setup involved.

Tests should normally be done in the same commit as the implementation itself, or rather not that separate, but for this project the tests are done in a separate commit before the implementation to emphasis how TDD is ongoing.

**It is strongly recommanded to look at commits one by one to have a full grasp of how things were developed and how TDD has been acted while developing**

## Notes

TTD proved its usefulness while searching to make all of your class testable. While designing `ProductCellTests`, it became obvious we wouldn't be able to test the display of the image with a real image url, as it would imply that our test rely on internet. It leads us to the conclusion that downloading an image should be done through a component that can be mockable. Therefore, we need to create something, a service, a controller, an image manager that is mockable (so behind an interface), it's interesting to note that without TDD, that option wouldn't have been considered, and the view would have just downloaded the image on its own. So now that we know we need that manager, we can safely asume the view model will give the UIImage (which is **not** a view, but data) directly, and that we would start creating that new "image manager" once we write the tests for the view model iteself.
