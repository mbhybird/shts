//
//  GuardVC.swift
//  SHTS
//
//  Created by ZhongTingliang on 26/09/2017.
//  Copyright © 2017 Buzz. All rights reserved.
//

import UIKit

class GuardVC: UIViewController {

    @IBAction func goToChat(){
        self.tabBarController?.performSegue(withIdentifier: "chatSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
