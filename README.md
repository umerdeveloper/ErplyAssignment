# ErplyAssignment

## News App

Our News App enables users to read latest news. Latest news is retrieved from newsapi.org and presented in a paginated format. Additionally, caches images to optimize speed and performance.

### Features

* Retrieve the latest news stories using newsapi.org api.
* Fully support for dark mode, which attracts to the users
* Cache downloaded images for faster loading times.
* Avoid displaying duplicate news stories.

## Tests
* There are some tests covered
  1. Date formatting
  2. Mocking network request
  3. Mocking news response

### Technology Stack
* MVVM
* SwiftUI and Async/await

## Guide for testing:

Use some temporary random generated email address e.g. https://tempmailo.com for getting temporary email address and use this to get api key from https://newsapi.org and use that, because it has some limitions 1000 results per api key, may be during testing you could get error that maximum results limit reached.
