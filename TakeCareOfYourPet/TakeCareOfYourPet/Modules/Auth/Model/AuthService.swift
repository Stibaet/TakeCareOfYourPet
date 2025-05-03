//
//  AuthService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 03.05.2025.
//

import FirebaseAuth

class AuthService {
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            
        }
    }
    
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            
            
        }
    }
}
