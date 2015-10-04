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

##License
(The MIT License)

Copyright (c) 2015 Alberto Moral Gómez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.