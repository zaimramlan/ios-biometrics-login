//
//  UseEmailPasswordWorker.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 25/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class UseEmailPasswordWorker {
  
  // MARK: Properties
  
  var emailModel: UseEmailPasswordModels.Email?
  var passwordModel: UseEmailPasswordModels.Password?
  
  // MARK: Validations
  
  func validate(email: String?) {
    emailModel = UseEmailPasswordModels.Email(isEmpty: true)
    
    if let string = email, !string.isEmpty {
      emailModel?.isEmpty = false
    }
  }
  
  func validate(password: String?) {
    passwordModel = UseEmailPasswordModels.Password(isEmpty: true)
    
    if let string = password, !string.isEmpty {
      passwordModel?.isEmpty = false
    }
  }
}
