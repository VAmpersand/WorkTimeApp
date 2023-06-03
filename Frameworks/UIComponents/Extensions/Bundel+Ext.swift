//
//  Bundel+Ext.swift
//  UIComponents
//
//  Created by Viktor Prikolota on 03.06.2023.
//

import Foundation

class BundleHandler {}

extension Bundle {
    static let uiComponents = Bundle(for: BundleHandler.self)
}
