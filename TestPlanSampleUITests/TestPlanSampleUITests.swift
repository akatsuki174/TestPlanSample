//
//  TestPlanSampleUITests.swift
//  TestPlanSampleUITests
//
//  Created by Akatsuki on 2019/12/08.
//  Copyright © 2019 akatsuki. All rights reserved.
//

import XCTest

class TestPlanSampleUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLabelLocalization() {
        XCTAssertEqual(app.staticTexts["greetingLabel"].label, localizedString(key: "Top_title_label"))
    }
    
    private var currentLanguage: (langCode: String, localeCode: String)? {
        let currentLocale = Locale(identifier: Locale.preferredLanguages.first!)
        guard let langCode = currentLocale.languageCode else {
            return nil
        }
        var localeCode = langCode
        if let scriptCode = currentLocale.scriptCode {
            localeCode = "\(langCode)-\(scriptCode)"
        } else if let regionCode = currentLocale.regionCode {
            localeCode = "\(langCode)-\(regionCode)"
        }
        return (langCode, localeCode)
    }

    private func localizedString(key:String) -> String {
        let localizationBundle = Bundle(path: Bundle(for: TestPlanSampleUITests.self).path(forResource: currentLanguage?.langCode, ofType: "lproj") ?? "")
        let result = NSLocalizedString(key, bundle:localizationBundle!, comment: "")        
        return result
    }
}
