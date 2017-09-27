//
//  ViewController.swift
//  TESTJOB
//
//  Created by Admin on 14/02/2017.
//  Copyright © 2017 Hans. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {

  @IBOutlet weak var loginBtn: FBSDKLoginButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Login button.
    loginBtn.readPermissions = ["public_profile", "email"]
    loginBtn.delegate = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if FBSDKAccessToken.current() != nil {
      self.goMapView()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  func goMapView() {
    // Show Map flow.
    DispatchQueue.main.async {
      self.performSegue(withIdentifier: "showMapviewSegue", sender: self)
    }
  }
  
  // MARK: FBSDKLoginButtonDelegate methods.
  
  func loginButton(_ loginButton: FBSDKLoginButton!,
                   didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
    if error != nil {
      // Login failure.
      print("Login failture")
      return
    }
  }
  
  func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    
  }
  
  func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
    return true
  }

}

