//
//  SwitchView.swift
//  FlutterInProject
//
//  Created by season on 2020/1/14.
//  Copyright © 2020 season. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct SwitchView: View {
    
    @State var isOn = false
    
    var body: some View {
        NavigationView {
            Toggle(isOn: $isOn) {
                Text("switch")
            }
            .padding()
            .navigationBarTitle("Switch", displayMode: .inline)
        }
    }
}

@available(iOS 13.0.0, *)
struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
