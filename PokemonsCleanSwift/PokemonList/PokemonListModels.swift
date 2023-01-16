//
//  PokemonListModels.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

typealias PokemonCellViewModel = PokemonList.ShowPokemons.ViewModel.PokemonCellViewModel

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

enum PokemonList {
    enum ShowPokemons {
        // response
        struct Response {
            let pokemons: [Character]
        }
        // viewModel
        struct ViewModel {
            struct PokemonCellViewModel: CellIdentifiable {
                let name: String
                let image: String
                
                var cellIdentifier: String {
                    "pokemonCell"
                }
                var cellHeight: Double {
                    100
                }
                
                init(pokemon: Character) {
                    name = pokemon.name
                    image = pokemon.sprites.other.home.front_default
                }
            }
            let rows: [PokemonCellViewModel]
        }
    }
}
