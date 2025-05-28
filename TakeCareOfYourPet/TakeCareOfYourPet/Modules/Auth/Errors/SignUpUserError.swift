//
//  CreateUserError.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 27.05.2025.
//

import FirebaseAuth

enum SignUpUserError: Error {
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
    
    var errorTitle: String {
        switch self {
        case .emailAlreadyInUse: "Электронный адрес используется"
        case .networkError: "Ошибка соединения"
        case .invalidEmail: "Введённый электронный адрес некорректен"
        case .unknownError: "Что-то пошло не так"
        }
    }
    
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse: "Адрес электронной почты уже используется другой учётной записью. Проверьте правильность введённого e-mail"
        case .networkError: "Соединение прервано. Проверьте настройки соединения с интернетом"
        case .invalidEmail: "Адрес электронной почты имеет неверный формат. Проверьте правильность введённого e-mail"
        case .unknownError: "Пожалуйста, попробуйте позднее"
        }
    }
}
