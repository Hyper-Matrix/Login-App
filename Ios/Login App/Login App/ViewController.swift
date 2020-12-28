//
//  ViewController.swift
//  Login App
//
//  Created by Abhishek Kumar on 28/12/20.
//

import UIKit
import FirebaseUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func logintapped(_ sender: UIButton) {
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            return
        }
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
        
    }
}
extension ViewController:FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error == nil else{
            return
        }
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
