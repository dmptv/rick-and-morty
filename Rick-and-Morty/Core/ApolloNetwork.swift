//
//  ApolloNetwork.swift
//  Rick-and-Morty
//
//  Created by Kanat on 17.01.2021.
//

import Apollo

class ApolloNetwork {
    static let shared = ApolloNetwork()
    private(set) lazy var apollo: ApolloClient = {
        return ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    }()
}


