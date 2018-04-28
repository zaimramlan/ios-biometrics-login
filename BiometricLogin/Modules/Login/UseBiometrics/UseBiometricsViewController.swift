//
//  UseBiometricsViewController.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 26/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UseBiometricsDisplayLogic: class {  
  func displayUseBiometricsResult(with viewModel: UseBiometricsModels.UseBiometrics.ViewModel)
}

class UseBiometricsViewController: UIViewController, UseBiometricsDisplayLogic {

  // MARK: Properties

  var router: (NSObjectProtocol & UseBiometricsRoutingLogic & UseBiometricsDataPassing)?
  var interactor: UseBiometricsBusinessLogic?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = UseBiometricsInteractor()
    let presenter = UseBiometricsPresenter()
    let router = UseBiometricsRouter()

    viewController.router = router
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    useBiometrics()
  }

  // MARK: Use Case - Use Biometrics
  
  func useBiometrics() {
    let request = UseBiometricsModels.UseBiometrics.Request()
    interactor?.UseBiometrics(with: request)
  }

  func displayUseBiometricsResult(with viewModel: UseBiometricsModels.UseBiometrics.ViewModel) {    
    switch viewModel.result {
    case .success:
      router?.routeToDashboard()
      
    case .cancel:
      router?.routeToBack()
      
    case .error:
      router?.routeToUseEmailPassword()
    }
  }
}
