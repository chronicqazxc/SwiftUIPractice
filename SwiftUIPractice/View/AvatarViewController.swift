//
//  AvatarViewController.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/4.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func initFromXib() -> AvatarViewController {
        let avatarViewController = AvatarViewController(nibName: "AvatarViewController", bundle: nil)
        return avatarViewController
    }

}
