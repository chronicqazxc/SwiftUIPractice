//
//  AvatarView.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/4.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import SwiftUI
import MapKit
import UIKit

struct AvatarView: UIViewControllerRepresentable, Identifiable {
    var id: String
    
    typealias UIViewControllerType = AvatarViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AvatarView>) -> AvatarViewController {
        AvatarViewController.initFromXib()
    }
    
    func updateUIViewController(_ uiViewController: AvatarViewController, context: UIViewControllerRepresentableContext<AvatarView>) {
        
        let image = Image(systemName: id)
            .resizable()
            .scaledToFit()
            .frame(height: 200, alignment: .center)
        
        let imageView = UIHostingController(rootView: image)

        uiViewController.view.addSubview(imageView.view)
        imageView.willMove(toParent: uiViewController)
        uiViewController.addChild(imageView)
        imageView.didMove(toParent: uiViewController)
        uiViewController.view.backgroundColor = UIColor(white: 1, alpha: 0.0)

        imageView.view.translatesAutoresizingMaskIntoConstraints = false
        imageView.view.centerXAnchor.constraint(equalTo: uiViewController.view.centerXAnchor).isActive = true
        imageView.view.centerYAnchor.constraint(equalTo: uiViewController.view.centerYAnchor).isActive = true
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(id: "test")
    }
}
