import Foundation
import PromiseKit

class Util {
    
    static let shared = Util()
    /*
    private let client = TrueTimeClient.sharedInstance
 
    // TrueTime
    func trueTimeStart() {
        client.start(hostURLs: [URL(string: "time.google.com")!])
    }
    
    func fetchTime() -> Promise<Bool> {
        return Promise { seal in
            client.fetchIfNeeded { result in
                switch result {
                case .success(_):
                    seal.fulfill(true)
                case let .failure(error):
                    seal.reject(error)
                }
            }
        }
    }
    
    public var now: Date {
        guard let now = client.referenceTime?.now() else {
            return Date()
        }
        return now
    }
    
    public var nowString: String {
        return timeFormatterUTC.string(from: now)
    }
    */
    
    func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    // DateFormatters
    private var timeFormatterUTC: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    var dateTimeFormatterUTC: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    //String to date
    func stringToDate(str: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: str) else {return ""}
        
        let units: Set<Calendar.Component> = [.hour, .day, .month, .year]
        let comps = Calendar.current.dateComponents(units, from: date)
        
        guard let day = comps.day else {return ""}
        guard let month = comps.month else {return ""}
        guard let year = comps.year else {return ""}
        let yearStr = String(year)
        let simpleYear = yearStr.dropFirst(2)
        return "\(day)/\(month)/\(simpleYear)"
    }
    
    // Validations
    func isValidEmail(_ email: String) -> Bool {
        if email.isEmpty {
            return false
        } else {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
    }
    
    static var deviceId: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
}
