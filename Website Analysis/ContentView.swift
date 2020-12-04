//
//  ContentView.swift
//  Website Analysis
//
//  Created by Chase Edson on 11/20/20.
//  Copyright © 2020 Chase Edson. All rights reserved.
//

import SwiftUI


//define proper window sizing for application, non resizable
struct windowSize {
let minWidth : CGFloat = 400
let minHeight : CGFloat = 350
let maxWidth : CGFloat = 400
let maxHeight : CGFloat = 350
}



//define function for determining URL test type
//0 - all tests
//1 - tech
//2 - performance
//3 - dns
//4 - ssl
//5 - schema
//6 - javascript



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

struct ContentView: View {
        
    @State var url: String = ""
    var tests = ["All Tests", "Tech Tests", "Performance Tests", "DNS Tests", "SSL Tests", "Schema Tests", "Javascript Tests"]
    @State private var selectedTest = 0
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Enter the URL for testing below:")
                .font(.title)
            HStack {
                Text("URL for testing:")
                    .font(.subheadline)
                TextField("example.com", text: $url)
            }
            Picker(selection: $selectedTest, label: Text("")) {
               ForEach(0 ..< tests.count) {
                  Text(self.tests[$0])
               }
            }
            Button(action: {
                generateWebWindow(url: self.url, selectedTest: self.selectedTest)
            }){
                Text("Test Site: " + self.url)
            }
        }
        .frame(minWidth: windowSize().minWidth, minHeight: windowSize().minHeight)
        .frame(maxWidth: windowSize().maxWidth, maxHeight: windowSize().maxHeight)
        .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 100))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
