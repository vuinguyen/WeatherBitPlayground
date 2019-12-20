import UIKit
import Foundation

var str = "Hello, playground"

// look at this for an example:
// https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory


print("\(WeatherBitAPIKey)")

// let's start by forming the URL
let city = "Raleigh,NC"

let exampleURL = "https://api.weatherbit.io/v2.0/current?city=Raleigh,NC&key=API_KEY"

let currentWeatherURL = "https://api.weatherbit.io/v2.0/current?" +
                        "key=\(WeatherBitAPIKey)" +
                        "&city=\(city)"

// create a URLSessionDataTask
func startLoad() {
    //let url = URL(string: "https://www.example.com/")!
  let url = URL(string: currentWeatherURL)!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          print("yo, we have an error here!")
          return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            print("yo, we have a server error here!")
            return
        }
        if let data = data {
            DispatchQueue.main.async {
                //self.webView.loadHTMLString(string, baseURL: url)
              print("data is: \(data)")
            }
        }
    }
    task.resume()
}

// see what data we get back in memory

startLoad()

