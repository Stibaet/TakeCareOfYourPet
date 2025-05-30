//
//  AuthServiceProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

protocol AuthServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<UserModel, SignUpUserError>) -> Void)
    func signIn(email: String, password: String, completion: @escaping (Result<String, SignInUserError>) -> Void)
    func logout(completion: @escaping (Result<Void, Error>) -> Void)

}
