//
//  MyVC.swift
//  SHTS
//
//  Created by ZhongTingliang on 25/09/2017.
//  Copyright © 2017 Buzz. All rights reserved.
//

import UIKit
import Eureka

class MyVC: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        form +++ Section("Profile")
            <<< LabelRow(){
                $0.title = "Avatar"
                $0.value = "photo here..."
            }
            <<< LabelRow(){ row in
                row.title = "First Name"
                row.value = "Nick"
            }
            <<< LabelRow(){ row in
                row.title = "Last Name"
                row.value = "Chung"
            }
            <<< LabelRow(){
                $0.title = "Phone No."
                $0.value = "18688186666"
            }
            +++ Section("Detail")
            <<< DateRow(){
                $0.title = "Birthday"
                $0.value = Date(timeIntervalSinceNow: 0)
                $0.disabled = true
            }
            
            <<< LabelRow(){
                $0.title = "Sex"
                $0.value = "Male"
            }
        
            <<< LabelRow(){
                $0.title = "Age"
                $0.value = "28"
            }
            <<< TextAreaRow(){
                $0.title = "Description"
                $0.value = "Hi I'm a Coder,\r\nNice to meet u."
                $0.disabled = true
            }
    
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
