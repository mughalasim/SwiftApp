//
//  Extensions.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import UIKit

protocol Formattable {
    func format(pattern: String) -> String
}
extension Formattable where Self: CVarArg {
    func format(pattern: String) -> String {
        return String(format: pattern, arguments: [self])
    }
}
extension Int: Formattable { }
extension Double: Formattable { }
extension Float: Formattable { }


// IMAGE LOADING ------------------------------------------------------------------------------
extension UIImageView {
    func loadImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func loadImage(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        loadImage(from: url, contentMode: mode)
    }
}
