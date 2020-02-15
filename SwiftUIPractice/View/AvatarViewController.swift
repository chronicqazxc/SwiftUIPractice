//
//  AvatarViewController.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/4.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import UIKit

protocol AvatarViewControllerDelegate {
    func imageViewController() -> UIViewController
}

class AvatarViewController: UIViewController {
    
    var delegate: AvatarViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageView = delegate?.imageViewController() else {
            return
        }

        view.addSubview(imageView.view)
        imageView.willMove(toParent: self)
        addChild(imageView)
        imageView.didMove(toParent: self)
        view.backgroundColor = UIColor(white: 1, alpha: 0.0)

        imageView.view.translatesAutoresizingMaskIntoConstraints = false
        imageView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    static func initFromXib(delegate: AvatarViewControllerDelegate) -> AvatarViewController {
        let avatarViewController = AvatarViewController(nibName: "AvatarViewController", bundle: nil)
        avatarViewController.delegate = delegate
        return avatarViewController
    }

}
