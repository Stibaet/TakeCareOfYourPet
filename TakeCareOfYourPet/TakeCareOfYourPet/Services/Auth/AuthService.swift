//
//  AuthService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 03.05.2025.
//

import FirebaseAuth

enum CreateUserError: Error {
    case emailAlreadyInUse
    case networkError
    case invalidEmail
    case unknownError
    
    init(error: AuthErrorCode) {
        switch error {
        case .emailAlreadyInUse: self = .emailAlreadyInUse
        case .networkError: self = .networkError
        case .invalidEmail: self = .invalidEmail
        default: self = .unknownError
        }
    }
    
    var title: String {
        switch self {
        case .emailAlreadyInUse: "Электронный адрес используется"
        case .networkError: "Ошибка соединения"
        case .invalidEmail: "Введённый электронный адрес некорректен"
        case .unknownError: "Что-то пошло не так"
        }
    }
    
    var description: String {
        switch self {
        case .emailAlreadyInUse: "Адрес электронной почты уже используется другой учётной записью. Проверьте правильность введённого e-mail"
        case .networkError: "Соединение прервано. Проверьте настройки соединения с интернетом"
        case .invalidEmail: "Адрес электронной почты имеет неверный формат. Проверьте правильность введённого e-mail"
        case .unknownError: "Пожалуйста, попробуйте позднее"
        }
    }
}

class AuthService: AuthServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<UserModel, CreateUserError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as? NSError {
                let signUpError = CreateUserError(error: AuthErrorCode(rawValue: error.code) ?? .internalError)
                completion(.failure(signUpError))
                print("[AuthService] error: \(signUpError.localizedDescription)")
                return
            }
            
            guard let firUser = result?.user else {
                completion(.failure(CreateUserError.unknownError))
                print("[AuthService] user error")
                return
            }
            
            let user = UserModel(id: firUser.uid, name: "", email: email, pets: [])
            completion(.success(user))
            
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        print("signIn")
    }
}
