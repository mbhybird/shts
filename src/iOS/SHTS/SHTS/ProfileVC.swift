//
//  FacebookProfileExampleViewController.swift
//  Neon
//
//  Created by Mike on 9/26/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit
import Neon


class ProfileVC: UIViewController {
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    let avatarImageView : UIImageView = UIImageView()
    let nameLabel : UILabel = UILabel()
    let nameLabel1 : UILabel = UILabel()
    let nameLabel2 : UILabel = UILabel()
    let cameraButton : UIButton = UIButton(type: .custom)
    
    let buttonContainerView : UIView = UIView()
    let postButton : IconButton = IconButton()
    let updateInfoButton : IconButton = IconButton()
    let activityLogButton : IconButton = IconButton()
    let moreButton : IconButton = IconButton()
    
    let buttonContainerView2 : UIView = UIView()
    let aboutView : ImageContainerView = ImageContainerView()
    let photosView : ImageContainerView = ImageContainerView()
    let friendsView : ImageContainerView = ImageContainerView()
    let otherView : ImageContainerView = ImageContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.image = UIImage(named: "searchBar")
        searchBar.contentMode = .scaleAspectFit
        
        bannerImageView.image = UIImage(named: "banner")
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(gotoLoginTab))
        bannerImageView.addGestureRecognizer(tapGR)
        
        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.layer.cornerRadius = 1.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.clipsToBounds = true
        
        cameraButton.setImage(UIImage(named: "camera"), for: .normal)
        
        nameLabel.textColor = UIColor.white
        nameLabel.text = "登录体验更多"
        nameLabel.numberOfLines = 1
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        
        buttonContainerView.backgroundColor = UIColor.white
        buttonContainerView.layer.shadowColor = UIColor.black.cgColor
        buttonContainerView.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        buttonContainerView.layer.shadowOpacity = 0.4
        
        postButton.label.text = "测评"
        postButton.imageView.image = UIImage(named: "测评－1-(1)")
        
        updateInfoButton.label.text = "文章"
        updateInfoButton.imageView.image = UIImage(named: "文章")
        
        activityLogButton.label.text = "你问我答"
        activityLogButton.imageView.image = UIImage(named: "你问我答")
        
        moreButton.label.text = "免费课程"
        moreButton.imageView.image = UIImage(named: "课程")
        
        buttonContainerView2.backgroundColor = UIColor.white
        buttonContainerView2.layer.shadowColor = UIColor.black.cgColor
        buttonContainerView2.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        buttonContainerView2.layer.shadowOpacity = 0.4
        
        aboutView.imageView.image = UIImage(named: "about")
        aboutView.label.text = "大咖课堂"
        
        photosView.imageView.image = UIImage(named: "photos")
        photosView.label.text = "守护计划"
        
        friendsView.imageView.image = UIImage(named: "friends")
        friendsView.label.text = "专业课程"
        
        otherView.imageView.image = UIImage(named: "banner")
        otherView.label.text = "预约咨询"
        
        navigationItem.titleView = searchBar
        
        view.backgroundColor = UIColor(red: 211/255.0, green: 214/255.0, blue: 219/255.0, alpha: 1.0)
        
        view.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerMaskView)
        bannerImageView.addSubview(cameraButton)
        bannerImageView.addSubview(avatarImageView)
        bannerImageView.addSubview(nameLabel)
        
        nameLabel1.textColor = UIColor.black
        nameLabel1.backgroundColor = UIColor.white
        nameLabel1.text = "我的服务"
        nameLabel1.numberOfLines = 1
        nameLabel1.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
        nameLabel2.textColor = UIColor.black
        nameLabel2.backgroundColor = UIColor.white
        nameLabel2.text = "我的互动"
        nameLabel2.numberOfLines = 1
        nameLabel2.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
        view.addSubview(nameLabel1)
        view.addSubview(nameLabel2)
        
        view.addSubview(buttonContainerView)
        buttonContainerView.addSubview(postButton)
        buttonContainerView.addSubview(updateInfoButton)
        buttonContainerView.addSubview(activityLogButton)
        buttonContainerView.addSubview(moreButton)
        
        
        view.addSubview(buttonContainerView2)
        buttonContainerView2.addSubview(aboutView)
        buttonContainerView2.addSubview(photosView)
        buttonContainerView2.addSubview(friendsView)
        buttonContainerView2.addSubview(otherView)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        layoutFrames()
    }
    
    func gotoLoginTab(){
        self.tabBarController?.performSegue(withIdentifier: "loginTabSegue", sender: self)
    }
    
    func layoutFrames() {
        let isLandscape : Bool = UIDevice.current.orientation.isLandscape
        let bannerHeight : CGFloat = view.height * 0.465
        let avatarHeightMultipler : CGFloat = isLandscape ? 0.75 : 0.43
        let avatarSize = bannerHeight * avatarHeightMultipler
        
        searchBar.fillSuperview()
        bannerImageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: bannerHeight)
        bannerMaskView.fillSuperview()
        avatarImageView.anchorInCorner(.bottomLeft, xPad: 15, yPad: 15, width: avatarSize, height: avatarSize)
        nameLabel.alignAndFillWidth(align: .toTheRightCentered, relativeTo: avatarImageView, padding: 15, height: 120)
        cameraButton.anchorInCorner(.bottomRight, xPad: 10, yPad: 7, width: 28, height: 28)
        nameLabel1.alignAndFillWidth(align: .underCentered, relativeTo: bannerImageView, padding: 0, height: 40)
        nameLabel2.alignAndFillWidth(align: .underCentered, relativeTo: buttonContainerView, padding: 0, height: 40)
        buttonContainerView.alignAndFillWidth(align: .underCentered, relativeTo: nameLabel1, padding: 0, height: 62)
        buttonContainerView.groupAndFill(group: .horizontal, views: [postButton, updateInfoButton, activityLogButton, moreButton], padding: 10)
        buttonContainerView2.alignAndFillWidth(align: .underCentered, relativeTo: nameLabel2, padding: 0, height: 120)
        buttonContainerView2.groupAndFill(group: .horizontal, views: [aboutView, photosView, friendsView, otherView], padding: 8)
    }
}

