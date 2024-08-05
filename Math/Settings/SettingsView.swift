//
//  SettingsView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 02.08.24.
//

import SwiftUI

struct SettingsView: View {

  @StateObject var viewModel = SettingsViewModel()

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("wr-app-language".localized())) {
          Picker("wr-language".localized(), selection: $viewModel.selectedLanguage) {
            ForEach(AppLanguage.allCases) { language in
              Text(language.displayName).tag(language)

            }
          }

        }
      }
      .navigationBarTitle("wr-settings".localized())
    }
    .navigationBarBackButtonHidden()
    .customNavigationBackButton()
  }
  
}

  #Preview {
    SettingsView()
  }
