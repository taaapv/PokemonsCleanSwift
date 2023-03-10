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
            let pokemons: [Pokemon]
        }
        // viewModel
        struct ViewModel {
            struct PokemonCellViewModel: CellIdentifiable {
                let name: String
                let url: String
                
                var cellIdentifier: String {
                    "pokemonCell"
                }
                var cellHeight: Double {
                    100
                }
                
                init(pokemon: Pokemon) {
                    name = pokemon.name
                    url = pokemon.url
                }
            }
            let rows: [PokemonCellViewModel]
        }
    }
}
