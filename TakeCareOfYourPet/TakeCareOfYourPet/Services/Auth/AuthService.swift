//
//  AuthService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 03.05.2025.
//

import FirebaseAuth

enum CreateUserError: Error {
    case createUserError
}

class AuthService: AuthServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<UserModel, any Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                print("[AuthService] error: \(error.localizedDescription)")
                return
            }
            
            guard let firUser = result?.user else {
                completion(.failure(CreateUserError.createUserError))
                print("[AuthService] user error")
                return
            }
            
            let user = UserModel(id: firUser.uid, name: "", email: email, pets: [])
            completion(.success(user))
            
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserModel, any Error>) -> Void) {
        print("signIn")
    }
}
