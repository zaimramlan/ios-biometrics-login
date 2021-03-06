//
//  WelcomeUserModels.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 28/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum WelcomeUserModels {
  
  // MARK: Use Cases
  
  enum WelcomeUser {
    struct Request {
    }

    struct Response {
      var useBiometrics: Bool
    }

    struct ViewModel {
      var useBiometrics: Bool
    }
  }
}
