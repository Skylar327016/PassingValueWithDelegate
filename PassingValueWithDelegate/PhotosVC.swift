import UIKit

protocol PhotosVCDelegate: class {
    func photoselected(photo: UIImage)
}

class PhotosVC: UIViewController {
    
    var collectionView: UICollectionView!
    var photos: [UIImage] = []
    weak var delegate: PhotosVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnLayout())
        view.addSubview(collectionView)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
    }
    
    func createTwoColumnLayout() ->  UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 24
        let padding: CGFloat = 24
        let width = view.bounds.width
        let itemWidth: CGFloat = (width - itemSpacing - 2 * padding) / 2
        
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumInteritemSpacing = itemSpacing
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        return layout
    }
    
    func configureDataSource(){
        for number in 1...8 {
            photos.append(UIImage(named: "\(number)")!)
        }
    }
}

extension PhotosVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as! PhotoCell
        cell.set(image: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        delegate.photoselected(photo: photo)
        dismiss(animated: true)
    }
    
}
