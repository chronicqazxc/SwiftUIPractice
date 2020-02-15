//
//  SFSymbolView.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/4.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import SwiftUI
import MapKit
import UIKit

struct SFSymbolView: UIViewControllerRepresentable, Identifiable {
    var id: String

    typealias UIViewControllerType = SFSymbolViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SFSymbolView>) -> SFSymbolViewController {
        SFSymbolViewController.initFromXib(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: SFSymbolViewController, context: UIViewControllerRepresentableContext<SFSymbolView>) {
        
    }
    
    func makeCoordinator() -> SFSymbolView.Coordinator {
        return Coordinator(imageName: id)
    }
    
    class Coordinator: NSObject, SFSymbolViewControllerDelegate {
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

struct SFSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolView(id: "test")
    }
}
