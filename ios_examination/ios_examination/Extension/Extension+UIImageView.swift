//
//  Extension+UIImageView.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String) {
        self.image = UIImage(named: "placeholder_error")

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
