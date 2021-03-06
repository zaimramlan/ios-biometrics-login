//
//  UseEmailPasswordInteractor.swift
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

protocol UseEmailPasswordBusinessLogic {
  func UseEmailPassword(with request: UseEmailPasswordModels.UseEmailPassword.Request)
}

protocol UseEmailPasswordDataStore {
}

class UseEmailPasswordInteractor: UseEmailPasswordBusinessLogic, UseEmailPasswordDataStore {
  var worker: UseEmailPasswordWorker? = UseEmailPasswordWorker()
  var presenter: UseEmailPasswordPresentationLogic?
  
  // MARK: Use Case - Use Email Password
  
  func UseEmailPassword(with request: UseEmailPasswordModels.UseEmailPassword.Request) {
    worker?.validate(email: request.email)
    worker?.validate(password: request.password)
    
    var containsErrors = true
    if let email = worker?.emailModel, let password = worker?.passwordModel {
      containsErrors = email.isEmpty || password.isEmpty
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
      let response = UseEmailPasswordModels.UseEmailPassword.Response(containsErrors: containsErrors)
      self.presenter?.presentUseEmailPasswordResult(with: response)
    }
  }
}
