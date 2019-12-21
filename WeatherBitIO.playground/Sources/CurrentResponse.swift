import Foundation
import CoreLocation

// After grabbing sample JSON from using Postman, I used the following
// tool to help generate these Codable structs: https://app.quicktype.io/
//public class CurrentResponse {

public struct CurrentResponseOld: Codable {
  public let data: [CurrentConditions]
  public let count: Int
}

public struct CurrentConditions: Codable {
    public let rh: Int
    public let pod: String
    public let lon, pres: Double
    public let timezone, obTime, countryCode: String
    public let clouds, ts: Int
    public let solarRAD: Double
    public let stateCode, cityName: String
    public let windSpd: Int
    public let lastObTime, windCdirFull, windCdir: String
    public let slp, vis: Double
    public let hAngle: Int
    public let sunset: String
    public let dni, dewpt: Double
    public let snow: Int
    public let uv: Double
    public let precip, windDir: Int
    public let sunrise: String
    public let ghi, dhi: Double
    public let aqi: Int
    public let lat: Double
    public let weather: Weather
    public let datetime: String
    public let temp: Int
    public let station: String
    public let elevAngle, appTemp: Double

    public enum CodingKeys: String, CodingKey {
        case rh, pod, lon, pres, timezone
        case obTime = "ob_time"
        case countryCode = "country_code"
        case clouds, ts
        case solarRAD = "solar_rad"
        case stateCode = "state_code"
        case cityName = "city_name"
        case windSpd = "wind_spd"
        case lastObTime = "last_ob_time"
        case windCdirFull = "wind_cdir_full"
        case windCdir = "wind_cdir"
        case slp, vis
        case hAngle = "h_angle"
        case sunset, dni, dewpt, snow, uv, precip
        case windDir = "wind_dir"
        case sunrise, ghi, dhi, aqi, lat, weather, datetime, temp, station
        case elevAngle = "elev_angle"
        case appTemp = "app_temp"
    }
}

// MARK: - Weather
public struct Weather: Codable {
    public let icon, code, weatherDescription: String

    public enum CodingKeys: String, CodingKey {
        case icon, code
        case weatherDescription = "description"
    }
}

//}



