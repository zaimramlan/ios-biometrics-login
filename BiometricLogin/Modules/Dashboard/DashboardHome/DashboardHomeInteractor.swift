//
//  DashboardHomeInteractor.swift
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
import SwiftKeychainWrapper

protocol DashboardHomeBusinessLogic {
  func fetchFromDataStore(with request: DashboardHomeModels.FetchFromDataStore.Request)
  func toggleUseBiometrics(with request: DashboardHomeModels.ToggleUseBiometrics.Request)
}

protocol DashboardHomeDataStore {
}

class DashboardHomeInteractor: DashboardHomeBusinessLogic, DashboardHomeDataStore {
  var worker: BiometricsWorker? = BiometricsWorker()
  var presenter: DashboardHomePresentationLogic?

  // MARK: Fetch Data From DataStore
  
  func fetchFromDataStore(with request: DashboardHomeModels.FetchFromDataStore.Request) {
    
    // check available biometry type
    var biometryType = DashboardHomeModels.BiometricsType.none
    let valueStored = KeychainWrapper.standard.integer(forKey: KeychainConstants.LocalAuthentication.type)
    if let value = valueStored, let type = worker?.BiometryType.init(rawValue: value) {
      switch type {
      case .faceID:
        biometryType = .faceID
        
      case .touchID:
        biometryType = .touchID
        
      default:
        biometryType = .none
      }
    }
    
    // retrieve value from keychain
    var useBiometrics = true
    if let value = KeychainWrapper.standard.bool(forKey: KeychainConstants.User.UseBiometrics) {
      useBiometrics = value
    }
    
    let response = DashboardHomeModels.FetchFromDataStore.Response(biometricsType: biometryType, useBiometrics: useBiometrics)
    presenter?.presentFetchFromDataStoreResult(with: response)
  }
  
  // MARK: Use Case - Toggle Use Biometrics
  
  func toggleUseBiometrics(with request: DashboardHomeModels.ToggleUseBiometrics.Request) {
    _ = KeychainWrapper.standard.set(request.useBiometrics, forKey: KeychainConstants.User.UseBiometrics)
    let response = DashboardHomeModels.ToggleUseBiometrics.Response()
    presenter?.presentToggleUseBiometricsResult(with: response)
  }
}
