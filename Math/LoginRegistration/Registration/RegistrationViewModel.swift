//
//  RegistrationViewModel.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 30.07.24.
//

import Combine
import Foundation

class RegistrationViewModel: ObservableObject {
  
  @Published  var email = ""
  @Published  var password = ""
  @Published  var repeatPassword = ""
  
}
