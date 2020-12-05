//
//  generateWebWindow.swift
//  Website Analysis
//
//  Created by Chase Edson on 12/4/20.
//  Copyright © 2020 Chase Edson. All rights reserved.
//

import Foundation
import SwiftUI

func generateWebWindow(url: String, selectedTest: Int) {
    print("The inputted URL is: \(url)")
    print("The selected test is: \(selectedTest)")
    //copy to clipboard
    let pasteboard = NSPasteboard.general
    pasteboard.declareTypes([.string], owner: nil)
    pasteboard.setString(url, forType: .string)
    
    let techTests = [
        "https://builtwith.com/",
        "https://w3techs.com/sites/info/",
        "https://www.wappalyzer.com/lookup/"
    ]
    
    let performanceTests = [
        "https://developers.google.com/speed/pagespeed/insights/?url=",
        "http://driver.connectionmodel.com/driver.php?test=gtmetrixMobile&url=",
        "http://driver.connectionmodel.com/driver.php?test=gtmetrixDesktop&url=",
        "https://search.google.com/test/mobile-friendly?url=",
        "https://www.dotcom-tools.com/website-speed-test.aspx?url=",
    ]
    
    let dnsTests = [
        "https://viewdns.info/dnsreport/?domain=",
        "https://intodns.com/",
    ]
    
    let sslTests = [
        "https://www.qualityssl.com/en/support/ssl-server-test.lasso?url=",
        "https://ssllabs.com/ssltest/analyze.html?d=",
    ]
    
    let schemaTests = [
        "https://search.google.com/structured-data/testing-tool#url=",
        "https://www.bing.com/toolbox/markup-validator#markupUrl=",
        "https://search.google.com/test/rich-results?user_agent=1&url=",
        "https://developers.facebook.com/tools/debug/?q=",
    ]
    
    let jsTests = [
        "https://developers.google.com/speed/pagespeed/insights/?url=",
        "http://driver.connectionmodel.com/driver.php?test=gtmetrixMobile&url=",
        "http://driver.connectionmodel.com/driver.php?test=gtmetrixDesktop&url=",
    ]
    
    let nonURLTests = [
        "https://thinkwithgoogle.com/feature/testmysite/",
        "https://webspeedtest.cloudinary.com"
    ]
    
    let allTests = techTests + performanceTests + dnsTests + sslTests + schemaTests
    
    if selectedTest == 0 {
        for allTest in allTests {
            NSWorkspace.shared.open(NSURL(string: allTest + url)! as URL)
        }
        for nonURLTest in nonURLTests {
            NSWorkspace.shared.open(NSURL(string: nonURLTest)! as URL)
        }
    }
    
    if selectedTest == 1 {
        //tech
        for techTest in techTests {
            NSWorkspace.shared.open(NSURL(string: techTest + url)! as URL)
        }
    }
    
    if selectedTest == 2 {
        //performance
        for performanceTest in performanceTests {
            NSWorkspace.shared.open(NSURL(string: performanceTest + url)! as URL)
        }
        for nonURLTest in nonURLTests {
            NSWorkspace.shared.open(NSURL(string: nonURLTest)! as URL)
        }
    }
    
    if selectedTest == 3 {
        //dns
        for dnsTest in dnsTests {
            NSWorkspace.shared.open(NSURL(string: dnsTest + url)! as URL)
        }
    }
    
    if selectedTest == 4 {
        //ssl
        for sslTest in sslTests {
            NSWorkspace.shared.open(NSURL(string: sslTest + url)! as URL)
        }
        
    }
    
    if selectedTest == 5 {
        //schema
        for schemaTest in schemaTests {
            NSWorkspace.shared.open(NSURL(string: schemaTest + url)! as URL)
        }
    }
    
    if selectedTest == 6 {
        //javascript
        for jsTest in jsTests {
            NSWorkspace.shared.open(NSURL(string: jsTest + url)! as URL)
        }
        for nonURLTest in nonURLTests {
            NSWorkspace.shared.open(NSURL(string: nonURLTest)! as URL)
        }
    }
}
