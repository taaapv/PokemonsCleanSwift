//
//  PokemonListPresenter.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

protocol PokemonListPresentationLogic {
    func presentPokemons(response: PokemonList.ShowPokemons.Response)
}

class PokemonListPresenter: PokemonListPresentationLogic {
    weak var viewController: PokemonListDisplayLogic?
    
    func presentPokemons(response: PokemonList.ShowPokemons.Response) {
        var rows: [PokemonCellViewModel] = []
        
        response.pokemons.forEach { rows.append(PokemonCellViewModel(pokemon: $0)) }
        
        let viewModel = PokemonList.ShowPokemons.ViewModel(rows: rows)
        viewController?.displayPokemons(viewModel: viewModel)
    }
}
