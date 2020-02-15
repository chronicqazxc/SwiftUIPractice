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
        AvatarViewController.initFromXib(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: AvatarViewController, context: UIViewControllerRepresentableContext<AvatarView>) {
        
    }
    
    func makeCoordinator() -> AvatarView.Coordinator {
        return Coordinator(imageName: id)
    }
    
    class Coordinator: NSObject, AvatarViewControllerDelegate {
        let imageName: String
        
        init(imageName: String) {
            self.imageName = imageName
        }
        
        func imageViewController() -> UIViewController {
            let imageView = Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200, alignment: .center)
            return UIHostingController(rootView: imageView)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(id: "test")
    }
}
