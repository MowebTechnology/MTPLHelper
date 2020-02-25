# MTPLHelper


## OVERVIEW
This project contains all API related structure configured in it

Moweb Techbology has it's own process to perform an API

## Installing pod
`pod 'MTPLHelper'`

## Initial configuration

* Extend **`APIManagerDelegate`** in app delegate, then


		func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
			self.setupAPIManager()
		}
		
		func setupAPIManager() {
	        APIManager.generalServerError = <YOUR VALUE>
	        APIManager.generalNoInternetError = <YOUR VALUE>
	        APIManager.shared.apiManagerDelegate = self
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: APIManagerProperty.defaultContentType)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: APIManagerProperty.jsonParameterRootKey)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: APIManagerProperty.headerKey)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: .progressHUDMessage)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: .apiFailureRetryViewParent)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: .apiFailureRetryView)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: .shouldShowAPIFailureRetryView)
	        APIManager.shared.register(defaultProperty: <YOUR VALUE>, for: .shouldParformAPIWhenInternetResume)
	    }
  
 
* **APIManagerDelegate** methods to be added in AppDelegate file


		func showProgressHUD(withMessage message: String?, senderVC: UIViewController, shouldShowProgressFlag: Bool) {
	        if shouldShowProgressFlag {
	        	// show progress hud of your choice
	        }
	    }
	    
	    func hideProgressHUD(senderVC: UIViewController, shouldShowProgressFlag: Bool) {
	        if shouldShowProgressFlag {
	        	// hide progress hud
	        }
	    }
	    
	    func showAlert(message: String, senderVC: UIViewController, shouldShowProgressFlag: Bool) {
	        if shouldShowProgressFlag {
	            // Show alert message
	        }
	    }
	    
	    func apiFailureRetryViewWillAppear(_ retryView: BaseAPIFailureRetryView) {
		         if let retryViewParsed = retryView as? APIFailureRetryView {
						// your code
		        }
	    }
	    
	    func apiFailureRetryViewExistingUpdated(_ retryView: BaseAPIFailureRetryView) {
		         if let retryViewParsed = retryView as? APIFailureRetryView {
						// your code
		        }
	    }
	    
	    func apiFailureRetryViewWillDisappear(_ retryView: BaseAPIFailureRetryView) {
		         if let retryViewParsed = retryView as? APIFailureRetryView {
						// your code
		        }
		}

> That is all done with AppDelegate basic configuration

## Usage

**Intro to APIManagerMediaFile class**

	public struct APIManagerMediaFile {
	    public var fileApiParamKey: String?
	    public var fileName: String?
	    public var fileData: Data?
	    public var fileURL: URL?
	    public var fileMimeType: String?
    }

**When you want to send attachments**

	APIManager.shared.post(urlString, requestBody: requestBody, mediaFiles: attachments, apiManagerProperties: apiManagerProperties, fromViewController: fromViewController, onSuccessHandler: { (data, statusCode) in
	               // Your code
	            }, onFailureHandler: { (errorString, statusCode) in
	                // Your code
	            }) {
	            	// NO INTERNET CONNECTION AVAILABLE
	             	// Your code
	            }
	            
**Without attachments**

	APIManager.shared.post(urlString, requestBody: requestBody, apiManagerProperties: apiManagerProperties, fromViewController: fromViewController, onSuccessHandler: { (data, statusCode) in
	               // Your code
	                
	            }, onFailureHandler: { (errorString, statusCode) in
					// Your code
	            }) {
	               // NO INTERNET CONNECTION AVAILABLE
	             	// Your code
	            }
	            
**Download**     

	APIManager.shared.download(from: urlString, fromViewController: vc, apiManagerProperties: propertySet, onSuccessHandler: { (destinationURL: URL) in
	            // Use destinationURL to get the file
	        }, onFailureHandler: { (errorMessage, statusCode) in
	        }) {
	         // NO INTERNET CONNECTION AVAILABLE
	        }
	        
**To check cached files**    
		
	if let cachedFile = APIManager.shared.checkCacheAvailable(atTemporaryDirectory: YOUR_FILEPATH) {
	
	} else {
		// Download File 
	}
	
	