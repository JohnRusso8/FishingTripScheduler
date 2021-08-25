//
//  ViewController.swift
//  FishingTripScheduler
//
//  Created by John Russo on 2/17/21.
//

import UIKit
class ViewController: UITableViewController {
    var tripStore: TripStore!
    
    
    
    override func tableView(_ tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return tripStore.allTrips.count
        
    }
    
    


    
    @IBAction func toggleEditMode(_ sender: UIButton) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)

            // Turn off editing mode
            setEditing(false, animated: true)
            
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)

            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    

    @IBAction func addNewTrip(_ sender: UIBarButtonItem) {
        // Create a new item and add it to the store
        let newItem = tripStore.createTrip()
        // Figure out where that item is in the array
        if let index = tripStore.allTrips.firstIndex(of: newItem) {
        let indexPath = IndexPath(row: index, section: 0)
                // Insert this new row into the table
        tableView.insertRows(at: [indexPath], with: .automatic) }
    }
    
    
    
    override func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

    // Set the text on the cell with the description of the item // that is at the nth index of items, where n = row this cell // will appear in on the table view
    let trip = tripStore.allTrips[indexPath.row]
    cell.name.text = trip.trip_type
    cell.date.text = "\(trip.trip_date)"
        
        
        let image : UIImage = UIImage(imageLiteralResourceName: "\(trip.trip_type)")
                cell.picture.image = image

    return cell
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 65
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.01568627451, green: 0.5137254902, blue: 0.09803921569, alpha: 1)
        

        
    }
    
    override func tableView(_ tableView: UITableView,
    commit editingStyle: UITableViewCell.EditingStyle,
    forRowAt indexPath: IndexPath) {
    // If the table view is asking to commit a delete command...
    if editingStyle == .delete {
        let trip = tripStore.allTrips[indexPath.row]
    // Remove the item from the store
        tripStore.removeTrip(trip)
            // Also remove that row from the table view with an animation
        tableView.deleteRows(at: [indexPath], with: .automatic) }
    }
    
    override func tableView(_ tableView: UITableView,
    moveRowAt sourceIndexPath: IndexPath,
    // Update the model
    to destinationIndexPath: IndexPath) {
    tripStore.moveTrip(from: sourceIndexPath.row, to: destinationIndexPath.row) }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // If the triggered segue is the "showItem" segue
    switch segue.identifier {
    case "showTrip":
    // Figure out which row was just tapped
    if let row = tableView.indexPathForSelectedRow?.row {
    // Get the item associated with this row and pass it along
        let trip = tripStore.allTrips[row]
    let detailViewController = segue.destination as! DetailViewController
        detailViewController.trip = trip
    }
    case "addTrip"?:

           do {

                let trip = Trip.init(random: false)

                let addViewController = segue.destination as! AddViewController

                addViewController.trip = trip

            tripStore.allTrips.append(trip)


            
            
            
            
        }
    default:
    preconditionFailure("Unexpected segue identifier.") }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData() }
    
}


