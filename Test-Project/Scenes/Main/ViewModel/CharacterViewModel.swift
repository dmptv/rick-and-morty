//
//  CharacterViewModel.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

protocol CharacterViewModelProtocol {
    var id: String? { get }
    var name: String? { get }
    var image: UIImage? { get }
    
}


struct CharacterViewModel: CharacterViewModelProtocol {
    var id: String?
    
    var name: String?
    
    var image: UIImage?
    
    
}
