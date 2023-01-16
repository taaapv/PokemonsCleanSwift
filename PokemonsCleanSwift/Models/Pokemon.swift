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

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
}

// MARK: - Character
struct Character: Codable {
    let locationAreaEncounters: String
    let name: String
    let species: Species
    let sprites: Sprites
}

struct Species: Codable {
    let name: String
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
