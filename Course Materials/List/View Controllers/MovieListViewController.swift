//
//  ListViewController.swift
//  Course Materials
//
//  Created by Matt Beaney on 28/02/2023.
//

import UIKit
import Combine

class MovieListViewController: UIViewController {
	
	@IBOutlet var containerView: UIView?
	@IBOutlet var collectionView: UICollectionView?
	
	private var cancellables = [AnyCancellable]()
	private let cellId = "movie_cell"
	
	var viewModel: MovieListViewModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configureCollectionView()
		self.bindToViewModel()
		self.viewModel.loadData()
	}
	
	private func configureCollectionView() {
		
		let nib = UINib(nibName: "MovieListCell", bundle: nil)
		self.collectionView?.register(
			nib,
			forCellWithReuseIdentifier: self.cellId
		)
		
		self.collectionView?.dataSource = self
		self.collectionView?.delegate = self
	}
	
	private func bindToViewModel() {
		
		self.cancellables = []
		
		self.viewModel.$cellModels
			.receive(on: RunLoop.main)
			.sink(receiveValue: { [weak self] _ in
				self?.collectionView?.reloadData()
			})
			.store(in: &cancellables)
	}
}

extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}
	
	func collectionView(
		_ collectionView: UICollectionView,
		numberOfItemsInSection section: Int
	) -> Int {
		self.viewModel.cellModels.count
	}
	
	func collectionView(
		_ collectionView: UICollectionView,
		cellForItemAt indexPath: IndexPath
	) -> UICollectionViewCell {
		
		let cellModel = self.viewModel.cellModels[indexPath.row]
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: self.cellId,
			for: indexPath
		) as! MovieListCell
		cell.bindViewModel(cellModel)
		return cell
	}
	
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath
	) -> CGSize {
		
		CGSize(width: collectionView.frame.width, height: 180.0)
	}
}
