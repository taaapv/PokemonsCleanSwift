//
//  PokemonListInteractor.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

protocol PokemonListBusinessLogic {
    func fetchPokemons()
}

protocol PokemonListDataStore {
    var pokemons: [Pokemon] { get }
}

class PokemonListInteractor: PokemonListBusinessLogic, PokemonListDataStore {
    var presenter: PokemonListPresentationLogic?
    var pokemons: [Pokemon] = []
    
    func fetchPokemons() {
        NetworkManager.shared.fetch(dataType: Pokemons.self, urlString: Link.pokemons.rawValue) { [unowned self] pokemons in
            self.pokemons = pokemons.results
            let response = PokemonList.ShowPokemons.Response(pokemons: self.pokemons)
            self.presenter?.presentPokemons(response: response)
        }
    }
}
