//
//  Provider.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Alamofire

protocol MainProvider {
   
}

final class Provider {
    let alamofireNetwork: AlamofireNetwork

    init(alamofireNetwork: AlamofireNetwork) {
        self.alamofireNetwork = alamofireNetwork
    }
}

extension Provider: MainProvider {
    
}
