# DLCardTokenizer SDK
The CardTokenizer SDK allows to tokenize a credit card for merchants that require the lower level of PCI compliance.

## Table of Contents (TODO)

## Requirements
- Xcode 13+
- Supports iOS 13 or higher

## Installation

### CocoaPods

## How to use

### 1) Create the SDK

```swift 
import DLCardTokenizerWebDropInSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    {...}

    var cardTokenizer: DLCardTokenizerWebDropIn!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        cardTokenizer = DLCardTokenizerWebDropIn(apiKey: "YOUR-API-KEY", country: "COUNTRY-CODE")
        return true
    }
}
```

Replace `apiKey` with your key and `countryCode` with the two letter [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code, for example "UY" for "Uruguay", or "US" for "United States".

### 2) Tokenize card

#### 2.1) Presentation and callbacks

```swift
let input = DLTokenizeInput(title: "Complete Purchase", // Title that will be set in the navigation bar
                            locale: "en", // Two letter language code from ISO-639 standard
                            buttonText: "Pay") // Text that will be set in the "Pay" button

cardTokenizer.start(input: input,
                    presenter: self,
                    onSuccess: { response in
        
                        // Called when the tokenization process has successfully completed
                        // Parameter will contain data about the card (including token) and installments data (if required)

                    }, onPresentation: {

                        // Called when the card tokenization interface is presented
    
                    }, onClose: {

                        // Called when the user dismisses the tokenization interface through the navigation bar "Close" button
    
                    }, onError: { [weak self] error in

                        // Called when the tokenization process ends with an error
                        // You are in charge of dealing with this error and presenting it to the user
            
                    })
```

#### 2.2) Additional customization

You can customize the tokenization interface through the `input` parameter as follows:

```swift
var input = DLTokenizeInput(title: "Complete Purchase",
                            locale: "en",
                            buttonText: "Pay")

// Set installments on/off (default is off)
input.installments = DLTokenizeInput.Installments(amount: 2000, currency: "USD")

// Set dark mode on/off (default is off)
input.style.darkMode = true

// Set card animation on/off (default is on)
input.style.cardAnimation = false

// Set button text and background color (default is white text with blue background)
input.style.button.textColor = "#ff0000"
input.style.button.backgroundColor = "#a154ce"
```


### Testing

When using fake data, you should create the sdk instance with `testMode: true` as seen next:

```swift
cardTokenizer = DLCardTokenizerWebDropIn(apiKey: "YOUR-API-KEY", country: "COUNTRY-CODE", testMode: true)
```

You will be provided with a different "API KEY" for each environment so make sure to use the correct one depending on what you pass in `testMode` parameter.

## Report Issues
If you have a problem or find an issue with the SDK please contact us at [mobile-dev@dlocal.com](mailto:mobile-dev@dlocal.com)

## License

```text
    MIT License

    Copyright (c) 2022 DLOCAL

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
```