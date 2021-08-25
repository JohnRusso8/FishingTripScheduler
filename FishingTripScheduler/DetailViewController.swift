//
//  DetailViewController.swift
//  FishingTripScheduler
//
//  Created by John Russo on 3/8/21.
//

import UIKit
class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    let fish = ["Seabass", "Bluefish", "Tog", "Drum", "Tuna", "Striper", "Fluke", "Mahi", "Tile"]
    
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var customer1: UITextField!
    @IBOutlet var customer2: UITextField!
    @IBOutlet var customer3: UITextField!
    @IBOutlet var customer4: UITextField!
    @IBOutlet var customer5: UITextField!
    @IBOutlet var customer6: UITextField!
    @IBOutlet var tripType: UITextField!
    @IBOutlet var tripDate: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fish.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fish[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
       tripType.text = fish[row]
        
        }
    
    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePicker.date)
        tripDate.text = strDate
        
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.01568627451, green: 0.5137254902, blue: 0.09803921569, alpha: 1)
        super.viewDidLoad()
            
            pickerView.delegate = self
            pickerView.dataSource = self
            
            
            datePicker.addTarget(self, action: #selector(DetailViewController.datePickerChanged(datePicker:)), for: UIControl.Event.valueChanged)
    }

    
    var trip: Trip!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        customer1.text = trip.cust1
        customer2.text = trip.cust2
        customer3.text = trip.cust3
        customer4.text = trip.cust4
        customer5.text = trip.cust5
        customer6.text = trip.cust6
        tripType.text = "\(trip.trip_type)"
        tripDate.text = "\(trip.trip_date)"
    
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
    // "Save" changes to item
        trip.trip_type = tripType.text?.capitalized ?? ""
        trip.trip_date = tripDate.text ?? ""
        trip.cust1 = customer1.text ?? ""
        trip.cust2 = customer2.text ?? ""
        trip.cust3 = customer3.text ?? ""
        trip.cust4 = customer4.text ?? ""
        trip.cust5 = customer5.text ?? ""
        trip.cust6 = customer6.text ?? ""
        
    }
    
}
