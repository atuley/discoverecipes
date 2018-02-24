This app currently only uses the Yummly API to search for recipes. I plan to add more recipe API's in the future.

To run this app locally, you will need to get an API key and ID from https://developer.yummly.com/. 
Once you have those two things, you will need to create a `Constants.swift` file and add the following: 

```
struct Constants {
    static let APP_ID = "YOUR API ID HERE"
    static let APP_KEY = "YOUR API KEY HERE"
}
```

Once you have your key and ID added, you should be able to search through the API from the simulator.
