//
//  PokemonListViewController.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import UIKit

protocol PokemonListDisplayLogic: AnyObject {
    func displayPokemons(viewModel: PokemonList.ShowPokemons.ViewModel)
}

class PokemonListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: PokemonListBusinessLogic?
    
    private var rows: [CellIdentifiable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        PokemonListConfigurator.shared.configure(with: self)
        getPokemons()
    }
    
    private func getPokemons() {
        interactor?.fetchPokemons()
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! PokemonTableViewCell
        cell.viewModel = cellViewModel
        return cell
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rows[indexPath.row].cellHeight
    }
}

extension PokemonListViewController: PokemonListDisplayLogic {
    func displayPokemons(viewModel: PokemonList.ShowPokemons.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
}
