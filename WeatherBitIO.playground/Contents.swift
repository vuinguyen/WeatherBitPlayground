import UIKit
import Foundation

var str = "Hello, playground"
// look at this for an example:
// https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory

struct CurrentResponse: Codable {
  let data: [CurrentConditions]
  let count: Int
}

struct CurrentConditions: Codable {
  let rh: Int
  let pod: String?
  let lon: Double
  let pres: Double
  let timezone:String
  let obTime: String
  let countryCode: String
  let clouds: Int
  let ts: Int
  let solarRAD: Double
  let stateCode: String
  let cityName: String
  let windSpd: Int
  let lastObTime: String
  let windCdirFull: String
  let windCdir: String
  let slp: Double
  let vis: Double
  let hAngle: Int
  let sunset: String
  let dni: Double
  let dewpt: Double
  let snow: Int
  let uv: Double
  let precip: Int
  let windDir: Int
  let sunrise: String
  let ghi: Double
  let dhi: Double
  let aqi: Int
  let lat: Double
  let weather: Weather
  let datetime: String
  let temp: Double
  let station: String
  let elevAngle: Double
  let appTemp: Double

  enum CodingKeys: String, CodingKey {
    case rh
    case pod
    case lon
    case pres
    case timezone
    case obTime = "ob_time"
    case countryCode = "country_code"
    case clouds
    case ts
    case solarRAD = "solar_rad"
    case stateCode = "state_code"
    case cityName = "city_name"
    case windSpd = "wind_spd"
    case lastObTime = "last_ob_time"
    case windCdirFull = "wind_cdir_full"
    case windCdir = "wind_cdir"
    case slp
    case vis
    case hAngle = "h_angle"
    case sunset
    case dni
    case dewpt
    case snow
    case uv
    case precip
    case windDir = "wind_dir"
    case sunrise
    case ghi
    case dhi
    case aqi
    case lat
    case weather
    case datetime
    case temp
    case station
    case elevAngle = "elev_angle"
    case appTemp = "app_temp"
  }
}

// MARK: - Weather
struct Weather: Codable {
  let icon: String
  let code: String
  let weatherDescription: String

  enum CodingKeys: String, CodingKey {
    case icon
    case code
    case weatherDescription = "description"
  }
}




print("\(WeatherBitAPIKey)")

// let's start by forming the URL
let city = "Raleigh,NC"
let units = "I"

let exampleURL = "https://api.weatherbit.io/v2.0/current?city=Raleigh,NC&key=API_KEY"

let currentWeatherURL = "https://api.weatherbit.io/v2.0/current?" +
  "key=\(WeatherBitAPIKey)" +
  "&city=\(city)" +
"&units=\(units)"

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

    guard let data = data else {
      print("couldn't get data! :(")
      return
    }
    print("data is: \(data)")

    let decoder = JSONDecoder()

    do {
      // let's parse some data here!

      // Note: this JSON decoding is not working
      //let response = try decoder.decode(CurrentResponse.self, from: data)
      //let forecast = response.data[0]
      //print("forecast is: \(forecast)")

       guard
       let resultsDictionary = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject] else {
       print("cannot serialize json!")
       return
       }
       //print(resultsDictionary)

      guard let count = resultsDictionary["count"] as? Int else {
        print("cannot get count")
        return
      }
      print("Int: \(count)")

      guard let firstData = resultsDictionary["data"] as? [[String: AnyObject]] else {
        print("cannot get forecast")
        return
      }
      print("forecast is: \(firstData[0])")

      guard let forecast = firstData[0] as? [String: AnyObject],
        let temperature = forecast["temp"] as? Double else {
        print("cannot get temperature")
        return
      }
      print("temperature is: \(temperature)")

      guard let weather = forecast["weather"] as? [String: AnyObject],
        let weatherDescription = weather["description"] as? String else {
          print("cannot get weather description")
          return
      }
      print("weather description is: \(weatherDescription)")

      DispatchQueue.main.async {
        //self.webView.loadHTMLString(string, baseURL: url)
        print("no error in parsing!")
      }
    } catch {
      print("error yo!")
      return
    }
  } // end shared.dataTask
  task.resume()
}

// see what data we get back in memory

startLoad()

