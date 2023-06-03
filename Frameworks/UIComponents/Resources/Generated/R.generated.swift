//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
public struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  public static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 3 colors.
  public struct color {
    /// Color `background_g1`.
    public static let background_g1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "background_g1")
    /// Color `titla_active`.
    public static let titla_active = Rswift.ColorResource(bundle: R.hostingBundle, name: "titla_active")
    /// Color `titla_inactive`.
    public static let titla_inactive = Rswift.ColorResource(bundle: R.hostingBundle, name: "titla_inactive")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "background_g1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    public static func background_g1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.background_g1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "titla_active", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    public static func titla_active(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.titla_active, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "titla_inactive", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    public static func titla_inactive(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.titla_inactive, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "background_g1", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    public static func background_g1(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.background_g1.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "titla_active", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    public static func titla_active(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.titla_active.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "titla_inactive", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    public static func titla_inactive(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.titla_inactive.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 2 files.
  public struct file {
    /// Resource file `Roboto-Medium.ttf`.
    public static let robotoMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Roboto-Medium", pathExtension: "ttf")
    /// Resource file `Roboto-Regular.ttf`.
    public static let robotoRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Roboto-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "Roboto-Medium", withExtension: "ttf")`
    public static func robotoMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.robotoMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Roboto-Regular", withExtension: "ttf")`
    public static func robotoRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.robotoRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 2 fonts.
  public struct font: Rswift.Validatable {
    /// Font `Roboto-Medium`.
    public static let robotoMedium = Rswift.FontResource(fontName: "Roboto-Medium")
    /// Font `Roboto-Regular`.
    public static let robotoRegular = Rswift.FontResource(fontName: "Roboto-Regular")

    /// `UIFont(name: "Roboto-Medium", size: ...)`
    public static func robotoMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: robotoMedium, size: size)
    }

    /// `UIFont(name: "Roboto-Regular", size: ...)`
    public static func robotoRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: robotoRegular, size: size)
    }

    public static func validate() throws {
      if R.font.robotoMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Roboto-Medium' could not be loaded, is 'Roboto-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.robotoRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Roboto-Regular' could not be loaded, is 'Roboto-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

public struct _R {
  fileprivate init() {}
}
