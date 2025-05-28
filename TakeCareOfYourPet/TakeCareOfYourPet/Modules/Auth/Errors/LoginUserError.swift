//
//  LoginUserError.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 27.05.2025.
//

import FirebaseAuth

enum SignInUserError: Error {
    
    case networkError
    case invalidEmail
    case wrongPassword
    case userNotFound
    case unknownError
    
    init(error: AuthErrorCode) {
        switch error {
            case .networkError: self = .networkError
            case .invalidEmail: self = .invalidEmail
            case .wrongPassword: self = .wrongPassword
            case .userNotFound: self = .userNotFound
            default: self = .unknownError
        }
    }
    
    var errorTitle: String {
        switch self {
            case .networkError: "Ошибка соединения"
            case .invalidEmail: "Некорректный e-mail"
            case .wrongPassword: "Неверный пароль"
            case .userNotFound: "Пользователь не найден"
            case .unknownError: "Кажется, что-то пошло не так"
        }
    }
    
    var errorMessage: String {
        switch self {
            case .networkError: "Соединение прервано. Проверьте настройки соединения с интернетом"
            case .invalidEmail: "Адрес электронной почты имеет неверный формат. Проверьте правильность введённого e-mail"
            case .wrongPassword: "Указан неверный пароль. Проверьте правильность введённого пароля"
            case .userNotFound: "Пользователь не найден. Возможно, учётная запись пользователя была удалена или указаны некорректные данные для входа"
            case .unknownError: "Пожалуйста, перепроверьте введённые данные и попробуйте снова"
        }
    }
}
