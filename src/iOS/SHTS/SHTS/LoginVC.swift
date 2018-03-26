//
//  LoginVC.swift
//  SHTS
//
//  Created by ZhongTingliang on 25/09/2017.
//  Copyright © 2017 Buzz. All rights reserved.
//

import UIKit
import SnapKit
import XLPagerTabStrip
import M13Checkbox
import SwiftyJSON
import Alamofire

class LoginVC: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "View"
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phoneNo = UITextField()
        phoneNo.placeholder = "输入手机号"
        phoneNo.borderStyle = .roundedRect
        phoneNo.clearButtonMode = .whileEditing
        view.addSubview(phoneNo)
        
        phoneNo.snp.makeConstraints { (make) in
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.top.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        let password = UITextField()
        password.placeholder = "请输入六位以上密码"
        password.borderStyle = .roundedRect
        password.clearButtonMode = .whileEditing
        password.isSecureTextEntry = true
        view.addSubview(password)
        
        password.snp.makeConstraints { (make) in
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.top.equalTo(120)
            make.centerX.equalToSuperview()
        }
        
        let checkBox = M13Checkbox()
        checkBox.boxType = .square
        view.addSubview(checkBox)
        
        let chkLabel = UILabel()
        chkLabel.text = "记住密码"
        view.addSubview(chkLabel)
        
        let forgotLabel = UILabel()
        forgotLabel.textColor = UIColor.red
        forgotLabel.text = "忘记密码?"
        view.addSubview(forgotLabel)
        
        checkBox.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.top.equalTo(200)
            make.left.equalTo(password).offset(5)
        }
        
        chkLabel.snp.makeConstraints { (make) in
            make.top.equalTo(203)
            make.left.equalTo(checkBox).offset(30)
        }
        
        forgotLabel.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.right.equalTo(password).offset(-5)
        }
        
        let btnLogin = UIButton()
        btnLogin.setTitle("登录", for: UIControlState.normal)
        btnLogin.backgroundColor = UIColor.red
        btnLogin.tintColor = UIColor.white
        view.addSubview(btnLogin)
        
        btnLogin.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(checkBox).offset(80)
            make.width.equalTo(360)
            make.height.equalTo(45)
        }
        
        btnLogin.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)
        
        let otherLoginMethod = UILabel()
        otherLoginMethod.text = "其他登录方式:"
        view.addSubview(otherLoginMethod)
        
        otherLoginMethod.snp.makeConstraints { (make) in
            make.top.equalTo(btnLogin).offset(80)
            make.left.equalTo(btnLogin).offset(10)
        }
        
        let ivWeChat = UIImageView()
        ivWeChat.image = UIImage(named:"微信")
        view.addSubview(ivWeChat)
        ivWeChat.snp.makeConstraints { (make) in
            make.top.equalTo(btnLogin).offset(73)
            make.left.equalTo(btnLogin).offset(130)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    func loginAction(){
        
        let url = URL(string:"http://www.spc-360.com/WebserviceByJson/userlogin")!
        
        let parameters: Parameters = [
            "ws_authcode": "d44ff7d9-4eb5-11e7-82d4-5254002e444c",
            "account": "abc",
            "password": "123"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
        }
        
        let sqliteContext = SQLiteManager() //如果没有,默认创建数据库及表格
        //插入数据
        sqliteContext.insertData(_name: "username", _email: "email@126.com")
        //读取全部数据
        //要想读取指定数据，可以自己自定义转换成其他模型，比如字典+元组，可以根据id查找
        let dataM = sqliteContext.readData()
        print(dataM)
        //更新数据 1 -> 用户id
        sqliteContext.updateData(userId: 1, old_name: "username", new_name: "newname")
        print(sqliteContext.readData())
        //删除数据
        sqliteContext.delData(userId: 1) // 1 -> 用户id
        print(sqliteContext.readData())
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
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
