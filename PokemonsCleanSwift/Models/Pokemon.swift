//
//  Pokemon.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

// MARK: - Pokemons
struct Pokemons: Codable {
    let results: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String
    let url: String
}

// MARK: - Character
struct Character: Codable {
    let sprites: Sprites
}

struct Sprites: Codable {
    let other: Home
}

struct Home: Codable {
    let home: ImagePokemon
}

struct ImagePokemon: Codable {
    let front_default: String
}
