//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by Матвей Матюшко on 06.02.2021.
//

import UIKit
import CoreData

class AddBirthdayViewController: UIViewController {
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SaveTapped(_ sender:UIBarButtonItem){
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let birthdate = birthdatePicker.date
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newBirthday=Birthday(context: context)
        newBirthday.firstName=firstName
        newBirthday.lastName=lastName
        newBirthday.birthdate = birthdate as Date?
        newBirthday.birthdayId=UUID().uuidString

        if let uniqueId=newBirthday.birthdayId{
            print("birthdayId:\(uniqueId)")
        }
        do{
            try context.save()
        } catch let error {
            print("error\(error).")
        }
        dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func cancelTapped(_ sender:UIBarButtonItem){
        dismiss(animated: true, completion: nil)
}

}
