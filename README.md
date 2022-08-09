# DLCardTokenizer SDK
The CardTokenizer SDK allows to tokenize a credit card for merchants that require the lower level of PCI compliance.

## Requirements
- Xcode 13 or higher
- iOS 13 or higher

## Installation

### CocoaPods

Add the following to your `Podfile`:

```
pod 'DLCardTokenizerWebDropInSDK'
```

## How to use

### 1) Create the SDK

Replace `apiKey` with your key and `countryCode` with the two letter [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code, for example "UY" for "Uruguay", or "US" for "United States".

When using fake data, you should create the sdk instance with `testMode: true`. You will be provided with a different "API KEY" for each environment so make sure to use the correct one depending on whether you are testing or not.


```swift 
import DLCardTokenizerWebDropInSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    {...}

    var cardTokenizer: DLCardTokenizerWebDropIn!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        cardTokenizer = DLCardTokenizerWebDropIn(apiKey: "YOUR-API-KEY", country: "COUNTRY-CODE", testMode: true)
        return true
    }
}
```

```objc
@import DLCardTokenizerWebDropInSDK;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) DLCardTokenizerWebDropIn *cardTokenizer;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.cardTokenizer = [[DLCardTokenizerWebDropIn alloc] initWithApiKey:@"YOUR-API-KEY"
                                                                  country:@"COUNTRY-CODE"
                                                                 testMode:YES];
    
    return YES;
}

@end
```


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

```objc    
    DLTokenizeInput *input = [[DLTokenizeInput alloc] initWithTitle:@"Complete Purchase" // Title that will be set in the navigation bar
                                                             locale:@"en" // Two letter language code from ISO-639 standard
                                                         buttonText:@"Pay"]; // Text that will be set in the "Pay" button
    
    [self.cardTokenizer startWithInput:input
                             presenter:self
                             onSuccess:^(DLTokenizeResponse * _Nonnull response) {
        
        // Called when the tokenization process has successfully completed
        // Parameter will contain data about the card (including token) and installments data (if required)
        
    } onPresentation:^{

        // Called when the card tokenization interface is presented
                
    } onClose:^{
        
        // Called when the user dismisses the tokenization interface through the navigation bar "Close" button
        
    } onError:^(DLError * _Nonnull error) {

        // Called when the tokenization process ends with an error
        // You are in charge of dealing with this error and presenting it to the user

    }];
```

#### 2.2) Additional customization

You can customize the tokenization interface through the `input` parameter as follows:

```swift
let input = DLTokenizeInput(title: "Complete Purchase",
                            locale: "en",
                            buttonText: "Pay")


input.installments = DLTokenizeInput.Installments(amount: 2000, currency: "USD")

// Set dark mode on/off (default is off)
input.style.darkMode = true

// Set card animation on/off (default is on)
input.style.cardAnimation = false

// Set button text and background color (default is white text with blue background)
input.style.button.textColor = "#ff0000"
input.style.button.backgroundColor = "#a154ce"
```

```objc
DLTokenizeInput *input = [[DLTokenizeInput alloc] initWithTitle:@"Complete Purchase" locale:@"en" buttonText:@"Pay"];
    
// Set installments on/off (default is off)
input.installments = [[DLTokenizeInputInstallments alloc] initWithAmount:2000 currency:@"USD"];

// Set dark mode on/off (default is off)
input.style.darkMode = true;

// Set card animation on/off (default is on)
input.style.cardAnimation = true;

// Set button text and background color (default is white text with blue background)
input.style.button.textColor = @"#ffffff";
input.style.button.backgroundColor = @"#2b6be9";

```

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