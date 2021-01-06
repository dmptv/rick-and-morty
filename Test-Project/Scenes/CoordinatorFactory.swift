//
//  CoordinatorFactory.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//


import Swinject
import UIKit

final class CoordinatorFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }
}
