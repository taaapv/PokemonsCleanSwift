//
//  PokemonTableViewCell.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class PokemonTableViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? PokemonCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.name

        NetworkManager.shared.fetch(dataType: Character.self, urlString: viewModel.url) { character in
            ImageManager.shared.fetchImage(from: character.sprites.other.home.front_default) { data in
                content.image = UIImage(data: data)
                
            }
        }
        contentConfiguration = content
    }
}
