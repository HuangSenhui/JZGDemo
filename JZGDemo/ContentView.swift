//
//  ContentView.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/2.
//

import SwiftUI

struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .edgesIgnoringSafeArea(.all)
    }
}
