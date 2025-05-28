//
//  AuthService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 03.05.2025.
//

import FirebaseAuth

class AuthService: AuthServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<UserModel, SignUpUserError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as? NSError {
                let signUpError = SignUpUserError(error: AuthErrorCode(rawValue: error.code) ?? .internalError)
                completion(.failure(signUpError))
                printError("[AuthService] error: \(signUpError.localizedDescription)")
                return
            }
            
            guard let firUser = result?.user else {
                completion(.failure(.unknownError))
                printError("[AuthService] user error")
                assertionFailure("Нет пользователя после успешной регистрации")
                return
            }
            
            let user = UserModel(id: firUser.uid, name: "", email: email, pets: [])
            completion(.success(user))
            
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserModel, SignInUserError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error as? NSError {
                let signInError = SignInUserError(error: AuthErrorCode(rawValue: error.code) ?? .internalError)
                completion(.failure(signInError))
                printError("[AuthService] error: \(signInError.localizedDescription)")
                return
            }
            
            guard let firUser = result?.user else {
                completion(.failure(.unknownError))
                printError("[AuthService] user error")
                assertionFailure("Нет пользователя после успешной авторизаци")
                return
            }
        }
    }
}
