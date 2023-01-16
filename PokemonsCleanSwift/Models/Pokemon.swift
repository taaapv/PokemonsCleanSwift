//
//  Pokemon.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

// MARK: - Pokemon
struct Pokemon {
    let name: String
    let location: String
    let species: String
    let image: String
}

// MARK: - Pokemons
struct Pokemons: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
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
