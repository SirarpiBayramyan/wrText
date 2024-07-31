//
//  LoginViewModel.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 30.07.24.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {

  @Published  var email = ""
  @Published  var password = ""

}
