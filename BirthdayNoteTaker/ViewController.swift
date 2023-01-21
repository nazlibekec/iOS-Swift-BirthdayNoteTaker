//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Nazlı on 12.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton! //Buttonu outlet olarak tanımladık.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Userdefault'a kaydedilen verileri çektik.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? (yapabilirsen yap) vs. as! (kesin yap)
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
            nameLabel.isHidden = false
        }else{
            nameLabel.isHidden = true
        }
        
        
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
            birthdayLabel.isHidden = false
            deleteButton.isHidden = false
        }else{
            birthdayLabel.isHidden = true
            deleteButton.isHidden = true
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        //Save Clicked
        UserDefaults.standard.setValue(nameTextField.text!, forKey: "name")
        UserDefaults.standard.setValue(birthdayTextField.text!, forKey: "birthday")
        // UserDefaults.standard.synchronize() artık kullanılmıyor.
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        nameLabel.isHidden = false
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        birthdayLabel.isHidden = false
        deleteButton.isHidden = false
        
        nameTextField.text = ""
        birthdayTextField.text = ""
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if storedName is String{  //if let newName = storedName as? String dedik sistem düzeltti.
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
            nameLabel.isHidden = true
        }
        
        
        if storedBirthday is String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
            birthdayLabel.isHidden = true
            deleteButton.isHidden = true
        }
        
        
    }
    
}
