//
//  UIFont+Ext.swift
//  UIComponents
//
//  Created by Viktor Prikolota on 03.06.2023.
//

import Foundation

extension UIFont {
    static func registerFonts(from bundle: Bundle) {
        let fontUrls = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil)!
        fontUrls.forEach { url in
            let fontDataProvider = CGDataProvider(url: url as CFURL)!
            let font = CGFont(fontDataProvider)!

            var error: Unmanaged<CFError>?
            guard CTFontManagerRegisterGraphicsFont(font, &error) else {
                fatalError("Could not register font from url \(url), error: \(error!.takeUnretainedValue())")
            }
        }
    }
}
