//
//  ListCell.swift
//  Course Materials
//
//  Created by Matt Beaney on 28/02/2023.
//

import UIKit

struct MovieListCellModel {
	
	let id: Int
	let posterUrl: String?
	let titleText: String
	let plotText: String
}

class MovieListCell: UICollectionViewCell {

	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var poster: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var plotLabel: UILabel!
	
	private var task: URLSessionDataTask?
	
	override func awakeFromNib() {
		super.awakeFromNib()
						
		self.poster.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		self.poster.layer.shadowColor = UIColor.black.cgColor
		self.poster.layer.shadowRadius = 0.0
		self.poster.layer.shadowOpacity = 0.5
		self.poster.clipsToBounds = false
		
		self.layer.backgroundColor = UIColor.clear.cgColor
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
		self.layer.shadowOpacity = 0.5
		self.layer.shadowRadius = 2.0
		self.layer.masksToBounds = false
		
		self.containerView.clipsToBounds = true
		self.containerView.layer.cornerRadius = 12.0
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		self.task?.cancel()
	}
	
	func bindViewModel(_ viewModel: MovieListCellModel) {
		
		self.titleLabel.text = viewModel.titleText
		self.plotLabel.text = viewModel.plotText
		self.bindImage(viewModel: viewModel)
		
		self.configureAccessibility(
			id: viewModel.id,
			titleText: viewModel.titleText
		)
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
	
	private func configureAccessibility(id: Int, titleText: String) {
		
		self.titleLabel.accessibilityLabel = "\(titleText)"
		self.titleLabel.isAccessibilityElement = true
		self.containerView.accessibilityIdentifier = "com.uitest.cell.\(id)"
		self.containerView.accessibilityTraits = .button
		self.containerView.isAccessibilityElement = true
	}
}
