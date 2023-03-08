//
//  DetailViewController.swift
//  Course Materials
//
//  Created by Matt Beaney on 28/02/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var titleLbl: UILabel!
	@IBOutlet weak var subtitleLbl: UILabel!
	
	@IBOutlet weak var posterContainer: UIView!
	@IBOutlet weak var poster: UIImageView!
	
	@IBOutlet weak var actorsLbl: UILabel!
	@IBOutlet weak var runTimeLbl: UILabel!
	
	var movie: Movie!
	
	override func viewDidLoad() {
		
		super.viewDidLoad()

		self.configureView()
		self.applyData()
	}
	
	private func configureView() {
		self.containerView.addShadow()
		self.poster.addShadow()
	}
	
	private func applyData() {
		self.titleLbl.text = self.movie.title
		self.subtitleLbl.text = self.movie.plot
		self.actorsLbl.text = self.movie.actors
		self.runTimeLbl.text = self.movie.runtime
		
		self.bindImage()
	}
	
	private func bindImage() {
		
		guard
			let urlString = self.movie.posterUrl,
			let url = URL(string: urlString)
		else {
			self.posterContainer.isHidden = true
			return
		}
		
		self.posterContainer.isHidden = false
		URLSession.shared.dataTask(with: url) { data, _, _ in
			
			DispatchQueue.main.async {
				guard
					let data,
					let image = UIImage(data: data)
				else {
					self.posterContainer.isHidden = true
					return
				}
				
				self.poster.image = image
			}
		}.resume()
	}
}
