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
    var pokemons: [Character] { get }
}

class PokemonListInteractor: PokemonListBusinessLogic, PokemonListDataStore {
    var presenter: PokemonListPresentationLogic?
    var pokemons: [Character] = []
    
    func fetchPokemons() {
        NetworkManager.shared.fetch(dataType: Pokemons.self, urlString: Link.pokemons.rawValue) { [unowned self] pokemons in
            pokemons.results.forEach { pokemon in
                NetworkManager.shared.fetch(dataType: Character.self, urlString: pokemon.url) { [unowned self] character in
                    self.pokemons.append(character)
                }
            }
        }
        let response = PokemonList.ShowPokemons.Response(pokemons: self.pokemons)
        self.presenter?.presentPokemons(response: response)
    }
}
