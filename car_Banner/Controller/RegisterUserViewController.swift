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
        if (nameRegTextField.text?.isEmpty)! ||
        (phoneRegTextField.text?.isEmpty)! ||
        (emailRegTextField.text?.isEmpty)! ||
        (passwordRegTextField.text?.isEmpty)! {
            return displayMessage(userMessage: "All fields are quired to fill in!")
        }
        
        if ((repPasswordRegTextField.text?.elementsEqual(repPasswordRegTextField.text!))! != true) {
            return displayMessage(userMessage: "Please make sure that your passwords match")
        }
        
        let myActivityIndicator = UIActivityIndicatorView( style: UIActivityIndicatorView.Style.medium )
        
        myActivityIndicator.center = view.center
        
        myActivityIndicator.hidesWhenStopped = false
        
        view.addSubview(myActivityIndicator)

        let myUrl = URL(string: "http://localhost:8000/api/user/registerDriver")
        
        let parameters = ["name": nameRegTextField.text!,
                          "email": emailRegTextField.text!,
                          "phone": phoneRegTextField.text!,
                          "password": repPasswordRegTextField.text!] as [ String: String ]
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        }catch let error {
            print(error.localizedDescription)
            displayMessage(userMessage: error.localizedDescription)
            return
        }
                
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?)
            in
            
            self.removeActivityyIndicator(activityIndicator: myActivityIndicator)
            
            if error != nil{
                self.displayMessage(userMessage: "could not successfully perfom this request. please try again tater")
                print("error=\(String(describing: error))")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                
                if let parseJSON = json{
                    
                    let userId = parseJSON["_id"] as? String
                    print("UserId=\(String(describing: userId))")
                    
                    if (userId?.isEmpty)!
                    {
                        self.displayMessage(userMessage: "could not succ")
                        return
                    }else{
                        self.displayMessage(userMessage: "Succsessful")
                    }
                }else{
                    self.displayMessage(userMessage: "could not succ")
                }
                
            }catch {
            self.removeActivityyIndicator(activityIndicator: myActivityIndicator)
            
            self.displayMessage(userMessage: "could")
            print(error)
        }
    }
            task.resume()
                    
        //        session.dataTask(with: request) { (data, response, error) in
        //            if let response = response {
        //                print(response)
        //            }
        //            guard let data = data else { return }
        //            print (data)
        //            do {
        //                let json = try JSONSerialization.jsonObject(with: data, options: [])
        //                print (json)
        //            }catch {
        //                print(error)
        //            }
        //        }.resume()
                
        //       !!!!!!! GET !!!!!!!!!!
        //        let session = URLSession.shared
        //        session.dataTask(with: myUrl) { (data, response, error) in
        //            if let response = response {
        //                print(response)
        //            }
        //
        //            guard let data = data else { return }
        //            print (data)
        //
        //            do {
        //                let json = try JSONSerialization.jsonObject(with: data, options: [])
        //                print (json)
        //            }catch {
        //                print(error)
        //            }
        //
        //        }.resume()
    }
    
    @IBAction func cancelRegButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
        
        func removeActivityyIndicator(activityIndicator: UIActivityIndicatorView){
            DispatchQueue.main.async{
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    
    func displayMessage(userMessage: String) -> Void {
        DispatchQueue.main.async{
            let alertController = UIAlertController(
                title: "Alert",
                message: userMessage,
                preferredStyle: .alert)
            
            let OKAction = UIAlertAction(
                title: "OK",
                style: .default) { (action:UIAlertAction!) in
                    print ("Ok button prassed")
                    DispatchQueue.main.async{
                        self.dismiss(animated: true, completion: nil)
                    }
            }
            
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
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
