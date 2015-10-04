#ReactiveAPI
ReactiveAPI is an API module that works with [Reactive Cocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) and [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper). The architecture is split in different logic parts: the managers, the network stuff, and the parser model.

##Requirements
- iOS 8.0+
- Xcode 7.0

##Installation
Run the following command in the root directory of your project

```bash
$ carthage update
``` 

##Architecture
![Architecture](https://raw.githubusercontent.com/MoralAlberto/ReactiveAPI/develop/images/architecture_reactiveAPI.png)

##Example
ReactiveAPI works with the Stackoverflow API. The main purpose is request the 30 most recent updated questions. 

All the logic between layers is separated, for instance: **network**, **parser**, **models** and **managers**.

The first step is call a method to get all the questions:

```swift
API.questions()
   .observe({ items in
      if let items = items.value {
         for item in items {
            print("\(item.title!)")
         }
      }
})
```

Then, the API calls the forward method in **Questions** Class with all the necessary information (URL and Request).

When the result is received from the previous request, the data is parsed in a correct model (all this happens in **Questions' manager**),then, the observer will receive all the questions.  