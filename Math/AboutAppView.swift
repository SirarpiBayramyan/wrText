//
//  AboutApp.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 25.07.24.
//

import SwiftUI

struct AboutAppView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image("small-app")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    Text("wrText")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.top, 20)

                // App Description
              Text("wr-about-this-app".localized())
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("This app is designed to help you efficiently and effectively find information quickly. With a user-friendly interface and a variety of features, you can enter text, read from images, or scan with your camera, ask about it to AI, and get an answer.")
                    .font(.body)
                    .padding(.bottom, 10)

                // Features
              Text("wr-features".localized())
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Open Ai")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                      Text("wr-scan-read".localized())
                    }
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                      Text("wr-user-friendly".localized())
                    }
                }
                .padding(.bottom, 10)

                // Developer Information
                Text("Developer")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Developed by SirRP.")
                    .font(.body)
                    .padding(.bottom, 10)

                // Version Information
                Text("Version 1.0")
                    .font(.footnote)
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("wr-about".localized())
    }
}

#Preview {
    AboutAppView()
}
