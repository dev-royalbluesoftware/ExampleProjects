//
//
// Werddinary
// UIView+Preview.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
//


import UIKit
import SwiftUI

extension UIView {
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    func showPreview() -> some View {
        Preview(view: self)
    }
}
