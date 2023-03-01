//
//  ListCell.swift
//  Course Materials
//
//  Created by Matt Beaney on 28/02/2023.
//

import UIKit

struct MovieListCellModel {
	
	let posterUrl: String?
	let titleText: String
	let plotText: String
}

class MovieListCell: UICollectionViewCell {

	@IBOutlet weak var poster: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var plotLabel: UILabel!
	
	private var task: URLSessionDataTask?
	
	override func awakeFromNib() {
		super.awakeFromNib()
				
		self.layer.cornerRadius = 12.0
		self.clipsToBounds = true
		
		self.poster.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		self.poster.layer.shadowColor = UIColor.black.cgColor
		self.poster.layer.shadowRadius = 0.0
		self.poster.layer.shadowOpacity = 0.5
		self.poster.clipsToBounds = false
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		self.task?.cancel()
	}
	
	func bindViewModel(_ viewModel: MovieListCellModel) {
		
		
		
		self.titleLabel.text = viewModel.titleText
		self.plotLabel.text = viewModel.plotText
		self.bindImage(viewModel: viewModel)
	}
	
	private func bindImage(viewModel: MovieListCellModel) {
		
		guard
			let urlString = viewModel.posterUrl,
			let url = URL(string: urlString)
		else {
			self.poster.isHidden = true
			return
		}
		
		self.poster.isHidden = false
		self.task = URLSession.shared.dataTask(with: url) { data, _, _ in
			
			DispatchQueue.main.async {
				guard
					let data,
					let image = UIImage(data: data)
				else {
					self.poster.isHidden = true
					return
				}
				
				self.poster.image = image
			}
		}
		
		self.task?.resume()
	}
}
