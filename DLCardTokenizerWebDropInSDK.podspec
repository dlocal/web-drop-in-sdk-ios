Pod::Spec.new do |spec|
    spec.name         = 'DLCardTokenizerWebDropInSDK'
    spec.version      = '0.0.1'
    spec.authors      = { 'dLocal' => 'mobile-dev@dlocal.com' }
    spec.homepage     = "https://bitbucket.org/dlocal-public/web-drop-in-sdk-ios/"
    spec.summary      = 'dLocal - Web based tokenizer SDK for iOS'
    spec.source       = { :http => "https://bitbucket.org/dlocal-public/web-drop-in-sdk-ios/downloads/DLCardTokenizerWebDropInSDK-#{spec.version.to_s}.zip" }
    spec.license      = { :type => 'Custom', :file => 'LICENSE.md' }
    spec.platform     = :ios
    spec.ios.deployment_target = '13.0'
    spec.ios.vendored_frameworks = "DLCardTokenizerWebDropInSDK.xcframework"
end
