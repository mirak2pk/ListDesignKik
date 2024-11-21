//
//  ListDesignKit.swift
//  ListDesignKit
//
//  Created by MacBook on 21/11/2024.
//


import SwiftUI

@available(iOS 15.0, *)
public enum ColorMaterial {
    case color(Color)
    case material(Material)
}

@available(iOS 15.0, *)
public enum ListStyleColor {
    case color(ColorMaterial)
    case gradient(LinearGradient)
    
    public var style: AnyShapeStyle {
        switch self {
        case .color(let colorOrMaterial):
            switch colorOrMaterial {
            case .color(let color): AnyShapeStyle(color)
            case .material(let material): AnyShapeStyle(material)
            }
        case .gradient(let gradient): AnyShapeStyle(gradient)
        }
    }
}

@available(iOS 15.0, *)
public struct ListDesign: ViewModifier {
    let backgroundStyle: ListStyleColor
    
    private var backgroundContent: AnyShapeStyle {
            switch backgroundStyle {
            case .color(let colorOrMaterial):
                switch colorOrMaterial {
                case .color(let color):
                    AnyShapeStyle(color)
                case .material(let material):
                    AnyShapeStyle(material)
                }
            case .gradient(let gradient):
                AnyShapeStyle(gradient)
            }
        }
    
    public func body(content: Content) -> some View {
        content
            .padding(22)
            .background(backgroundContent, in: .rect(cornerRadius: 15, style: .continuous))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
            .scaleEffect(1)
            .padding(8)
    }
}

@available(iOS 15.0, *)
public extension View {
    func listDesign(background: ListStyleColor) -> some View {
        modifier(ListDesign(backgroundStyle: background))
    }
}
