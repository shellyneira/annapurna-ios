//
//  API.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/13/22.
//

import Foundation

typealias JSON = [String: Any]

enum API<T: Codable> {
    
    case login
    case todayMeal
    case addRating
}

extension API {
    
    private var url: URL {
        return URL(string: "http://localhost:8080/api/v1")!.appendingPathComponent(path)
    }
    
    private var path: String {
        switch self {
        case .login: return "login"
        case .todayMeal: return "daily-meals"
        case .addRating: return "daily-meals/rating"
        }
    }
    
    private var method: String {
        switch self {
        case .login, .addRating: return "POST"
        case .todayMeal: return "GET"
        }
    }
    
    private var header: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .login: headers["Content-Type"] = "application/x-www-form-urlencoded"
        default: headers["Content-Type"] = "application/json"
        }
        if !accessToken.isEmpty {
            headers["Authorization"] = "Bearer " + accessToken
        }
        return headers
    }
    
    func request(params: JSON? = nil, completionHandler: @escaping (Result<T, Error>) -> Void) {
        var request: URLRequest!
        if let params = params as? [String: String] {
            if method == "GET" {
                var bodyComps = URLComponents(url: url, resolvingAgainstBaseURL: false)
                bodyComps?.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
                request = URLRequest(url: (bodyComps?.url)!)
            } else {
                var bodyComps = URLComponents()
                bodyComps.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
                request = URLRequest(url: url)
                request.httpBody = bodyComps.query?.data(using: .utf8)
            }
        } else if let params = params {
            request = URLRequest(url: url)
            request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }
        
        request.httpMethod = method
        request.allHTTPHeaderFields = header
        print(request)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(response)
            DispatchQueue.main.async {
                print(String(data: data ?? Data(), encoding: String.Encoding.utf8))
                guard let data = data,
                      let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    completionHandler(.failure(error ?? AppError.failToDecode))
                    return
                }
                completionHandler(.success(decoded))
            }
        }.resume()
    }
}

enum AppError: Error {
    case failToDecode
}

struct EmptyResult: Codable {}
