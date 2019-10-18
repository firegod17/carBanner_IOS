//
//  RegisterUserViewController.swift
//  car_Banner
//
//  Created by максим теодорович on 10/18/19.
//  Copyright © 2019 максим теодорович. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {
    @IBOutlet weak var nameRegTextField: UITextField!
    @IBOutlet weak var phoneRegTextField: UITextField!
    @IBOutlet weak var emailRegTextField: UITextField!
    @IBOutlet weak var passwordRegTextField: UITextField!
    @IBOutlet weak var repPasswordRegTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerUserButtonClicked(_ sender: Any) {
    }
    @IBAction func cancelRegButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
