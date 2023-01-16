//
//  PokemonListConfigurator.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

final class PokemonListConfigurator {
    static let shared = PokemonListConfigurator()
    private init() {}
    
    func configure(with viewController: PokemonListViewController) {
        let interactor = PokemonListInteractor()
        let presenter = PokemonListPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
