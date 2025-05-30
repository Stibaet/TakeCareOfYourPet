//
//  Utils.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 15.05.2025.
//

import Foundation

func printLog(_ string: String) {
#if DEBUG
    print("LOG: \(string)")
#endif
}

func printError(_ error: String) {
#if DEBUG
    print("ERROR🚨: \(error)")
#endif
}

func printDeinit<T>(_ instance: T) {
#if DEBUG
    print("DEINIT: \(String(describing: type(of: instance)))")
#endif
}
