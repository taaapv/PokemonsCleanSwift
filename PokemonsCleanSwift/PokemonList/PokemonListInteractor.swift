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
    var pokemonList: [Result] = []
    var pokemons: [Pokemon] = []
    
    func fetchPokemons() {
        NetworkManager.shared.fetch(dataType: Pokemons.self, urlString: Link.pokemons.rawValue) { [unowned self] pokemons in
            self.pokemonList = pokemons.results
        }
        pokemonList.forEach { result in
            DispatchQueue.global().async {
                NetworkManager.shared.fetch(dataType: Character.self, urlString: result.url) { [unowned self] character in
                    self.pokemons.append( Pokemon(
                        name: character.name,
                        location: character.locationAreaEncounters,
                        species: character.species.name,
                        image: character.sprites.other.home.front_default)
                    )
                }
            }
        }
        DispatchQueue.main.async { [unowned self] in
            let response = PokemonList.ShowPokemons.Response(pokemons: self.pokemons)
            self.presenter?.presentPokemons(response: response)
        }
    }
}
