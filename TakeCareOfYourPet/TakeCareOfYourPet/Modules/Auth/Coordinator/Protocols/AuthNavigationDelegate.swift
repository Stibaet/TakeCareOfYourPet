//
//  AuthNavigationDelegate.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 03.05.2025.
//

protocol WelcomeNavigationDelegate: AnyObject {
    func showSignUpScreen()
    func showSignInScreen()
}

protocol SignUpNavigationDelegate: AnyObject {
    func didSignUpSuccesfully()
}

protocol SignInNavigationDelegate: AnyObject {
    func didSignInSuccesfully()
}
