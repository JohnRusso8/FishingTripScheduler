//
//  Trip.swift
//  FishingTripScheduler
//
//  Created by John Russo on 2/24/21.
//

import UIKit

class Trip: Equatable, Codable {
    
    var cust1: String
    var cust2: String
    var cust3: String
    var cust4: String
    var cust5: String
    var cust6: String

    var trip_type: String
    var trip_date: String
    
    
    

    
    static func ==(lhs: Trip, rhs: Trip) -> Bool {
        return lhs.trip_type == rhs.trip_type
            && lhs.trip_date == rhs.trip_date
    }

    init(trip_type: String, trip_date: String,cust1: String, cust2: String, cust3: String,cust4: String,cust5: String, cust6: String) {
        self.trip_type = trip_type
        self.trip_date = trip_date
        self.cust1 = cust1
        self.cust2 = cust2
        self.cust3 = cust3
        self.cust4 = cust4
        self.cust5 = cust5
        self.cust6 = cust6
    }
    
    convenience init(random: Bool = false) {
        if random {
            let fish = ["Seabass", "Bluefish", "Tog", "Drum", "Tuna", "Striper", "Fluke", "Mahi", "Tile"]
            let customer = ["John Russo","Christopher Korobellis","Jake Bohn","Mike Nalbach","Jake Grossman","Eric Jachim"]
            
            let randomFish = fish.randomElement()!
            let randomCustomer1 = customer.randomElement()!
            let randomCustomer2 = customer.randomElement()!
            let randomCustomer3 = customer.randomElement()!
            let randomCustomer4 = customer.randomElement()!
            let randomCustomer5 = customer.randomElement()!
            let randomCustomer6 = customer.randomElement()!

            let randomName = "\(randomFish)"
            let randCust1 = "\(randomCustomer1)"
            let randCust2 = "\(randomCustomer2)"
            let randCust3 = "\(randomCustomer3)"
            let randCust4 = "\(randomCustomer4)"
            let randCust5 = "\(randomCustomer5)"
            let randCust6 = "\(randomCustomer6)"
            
            let randomMonth = Int.random(in: 3..<12)
            var randomDay = 1
            if (randomMonth == 2)
            {
                randomDay = Int.random(in: 1..<28)
            }
            else if (randomMonth == 1 || randomMonth == 3 || randomMonth == 5 || randomMonth == 7 || randomMonth == 8 || randomMonth == 10 || randomMonth == 12)
            {
                randomDay = Int.random(in: 1..<31)
            }
            else{
                randomDay = Int.random(in: 1..<30)
            }
            

            self.init(trip_type: randomName,
                      trip_date: "\(randomMonth)/\(randomDay)/2021",
                      cust1: randCust1, cust2: randCust2,cust3: randCust3,cust4: randCust4,cust5: randCust5,cust6: randCust6)
        } else {
            self.init(trip_type: "", trip_date: "", cust1: "", cust2: "",cust3: "",cust4: "",cust5: "",cust6: "")
        }
    }
    
    
}
