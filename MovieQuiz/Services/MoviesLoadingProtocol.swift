//
//  MoviesLoadingProtocol.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 27.11.2023.
//

import Foundation

protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}
