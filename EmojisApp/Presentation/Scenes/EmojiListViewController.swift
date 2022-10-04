import Foundation
import UIKit

/*
 Steps to create a Collection View:
 
 1 - Create the Collection's layout
 2 - Initialize the Collection
 3 - Register the Cells
 4 - Set the Data Source and the Delegate
 */

class EmojisListViewController: UIViewController {
    var collectionView: UICollectionView!
    var colors: [UIColor] = [.blue, .green, .red, .yellow, .black]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        addViewsToSuperview()
        setUpConstraints()
    }
    
    private func setUpViews() {
        setUpCollectionView()
    }
    
    private func addViewsToSuperview() {
        view.addSubview(collectionView)
    }
    
    private func setUpConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setUpCollectionView() {
        // MARK: - 1 - Collection's Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        
        // MARK: - 2 - Collection's Constructor
        collectionView = .init(frame: .zero, collectionViewLayout: layout)
        // MARK: - 3 - Registering the Cells
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "cell")
        
        // MARK: - 4 - Delegate & DataSource
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Collection's Data Source
extension EmojisListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ColorCell else {
            return UICollectionViewCell()
        }
        cell.color = colors[indexPath.row]
        return cell
    }
}

// MARK: - Collection's Delegate Flow Layout
extension EmojisListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 3 - layout.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: widthPerItem)
    }
}

