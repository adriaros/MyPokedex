//
//  PokemonDetailDataTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import UIKit

class PokemonDetailDataTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonNameLabel: DSLabel!
    
    @IBOutlet weak var pokemonTypesTitleLabel: DSLabel!
    @IBOutlet weak var pokemonTypesCollectionView: UICollectionView!
    
    @IBOutlet weak var pokemonWeightTitleLabel: DSLabel!
    @IBOutlet weak var pokemonWeightValueLabel: DSLabel!
    
    @IBOutlet weak var pokemonHeightTitleLabel: DSLabel!
    @IBOutlet weak var pokemonHeightValueLabel: DSLabel!
    
    private let layout = UICollectionViewFlowLayout()
    
    var pokemonTypes: [PokemonType]? {
        didSet {
            pokemonTypesCollectionView.reloadData()
        }
    }
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configureCollectionView()
    }
    
    func configureCollectionView() {
        pokemonTypesCollectionView.register(UINib(nibName: PokemonDetailTypeCollectionViewCell.cellType, bundle: nil),
                                forCellWithReuseIdentifier: PokemonDetailTypeCollectionViewCell.cellType)
        pokemonTypesCollectionView.dataSource = self
        pokemonTypesCollectionView.delegate = self
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        pokemonTypesCollectionView.collectionViewLayout = layout
    }
    
    func configure(pokemon: Pokemon) {
        pokemonTypes = pokemon.types
        pokemonNameLabel.style = .header(pokemon.displayName, .black, .center, true, 1)
        pokemonTypesTitleLabel.style = .title("Type", .black, .left, true, 1)
        pokemonWeightTitleLabel.style = .title("Weight", .black, .left, true, 1)
        pokemonWeightValueLabel.style = .paragraph(pokemon.displayWeight, .darkGray, .left, true, 1)
        pokemonHeightTitleLabel.style = .title("Height", .black, .left, true, 1)
        pokemonHeightValueLabel.style = .paragraph(pokemon.displayHeight, .darkGray, .left, true, 1)
    }
}

extension PokemonDetailDataTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonTypes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonDetailTypeCollectionViewCell.cellType,
                                                      for: indexPath) as! PokemonDetailTypeCollectionViewCell
        
        cell.configure(image: pokemonTypes?[indexPath.row].displayImage)
        return cell
    }
}

extension PokemonDetailDataTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 40, height: 40)
    }
}
