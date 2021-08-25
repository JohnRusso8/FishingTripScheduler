//
//  TripStore.swift
//  FishingTripScheduler
//
//  Created by John Russo on 2/24/21.
//

import UIKit

class TripStore {

    var allTrips = [Trip]()
    
    let tripArchiveURL: URL = { let documentsDirectories =
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
    return documentDirectory.appendingPathComponent("trips.plist")
    }()
    
    @discardableResult func createTrip() -> Trip {
        let newTrip = Trip(random: true)

        allTrips.append(newTrip)

        return newTrip
    }
    func removeTrip(_ trip: Trip) {
        if let index = allTrips.firstIndex(of: trip) {
            allTrips.remove(at: index) }
    }

    func moveTrip(from fromIndex: Int, to toIndex: Int) { if fromIndex == toIndex {
    return }
    // Get reference to object being moved so you can reinsert it
        let movedTrip = allTrips[fromIndex]
    // Remove item from array
        allTrips.remove(at: fromIndex)
        // Insert item in array at new location
    allTrips.insert(movedTrip, at: toIndex) }
    
    @objc func saveChanges() -> Bool {
        print("Saving items to: \(tripArchiveURL)")
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allTrips)
            try data.write(to: tripArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
    } catch let encodingError {
        print("Error encoding allTrips: \(encodingError)")
        return false
        }
    
    }
    
    init() {
        do {
        let data = try Data(contentsOf: tripArchiveURL)
        let unarchiver = PropertyListDecoder()
        let trips = try unarchiver.decode([Trip].self, from: data)
            allTrips = trips
        } catch {
        print("Error reading in saved items: \(error)") }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
}
