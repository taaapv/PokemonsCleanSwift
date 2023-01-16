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
        
        ImageManager.shared.fetchImage(from: viewModel.image) { data in
            content.image = UIImage(data: data)
        }
        contentConfiguration = content
    }
}
