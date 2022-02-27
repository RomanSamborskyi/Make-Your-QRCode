//
//  SettingsView.swift
//  Make Your QR
//
//  Created by Roman Samborskyi on 27.02.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            Form{
                  Text("Wellcome to settings")
                    .font(.title)
            }
                .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
