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
