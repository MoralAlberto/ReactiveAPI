#ReactiveAPI
ReactiveAPI is an API module that works with [Reactive Cocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) and [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper). The architecture is split in different logic parts: the managers, the network stuff, and the parser model.

This is a way to create a REST API with one goal: **Easy to maintain**. You can add more targets, managers or models in an easy way.

The demo shows you who you can get the las 30 questions in **Stackoverflow** subscribing to a **cold signal** and parsing the JSON to the correct model ready to be displayed/used in your controller/view.

Managers 	 | 			Models | 	Utils
------------ | ------------- | ------------
Questions Manager | Model Question  | Contants
 				 | Model Items  	| 

The demo only shows a request to obtain questions in **Stackoverflow**, when the JSON is successfuly retrieved, it's modeled with Model Question and Model Items ready to use in the view controller.

You can add more targets if you want to override the APIPathQuestions (maybe you0ve different deploy targets), to do that you only need to duplicate the APIConstants.plist and Info.plist and create a new scheme.

##Requirements
- iOS 8.0+
- Xcode 7.1

##Installation
Run the following command in the root directory of your project

```bash
$ carthage update
``` 

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

**Questions' manager**, this class manage the data received from the request, and then it parses to a correct model and sends the object within the signal, then, the observer (the view controller) will receive all the questions because it's subscribed to receive a list of **items**.  

###Parser Manager
The best part of this method are Generics. We can parse any class with this method, reusable code! 

```swift
static func parse<T: Mappable>(data: NSData, toClass: T.Type) -> T {
   let parsedObject: AnyObject?
   do {
      parsedObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
   } catch _ as NSError {
      parsedObject = nil
   }
   let result = Mapper<T>().map(parsedObject)
   return result!
}
```

###Network Manager
Creates the network request, this class also is reusable with any server request.

```swift
class func dataWithRequest(request: NSURLRequest) -> SignalProducer<NSData, NSError> {
   return NSURLSession.sharedSession().rac_dataWithRequest(request)
          .retry(2)
          .map { data, URLResponse in
             return data
          }
          .flatMapError { error in
             print("Network error ocurred: \(error)")
             return SignalProducer.empty
          }
}
```

##Architecture
![Architecture](https://raw.githubusercontent.com/MoralAlberto/ReactiveAPI/develop/images/architecture_reactiveAPI.png)

##License
ReactiveAPIO is available under the MIT license.