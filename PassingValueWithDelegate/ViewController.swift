import UIKit

class ViewController: UIViewController {
    
    let avatarImageView = UIImageView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    
    private func configureUI() {
        view.addSubview(avatarImageView)
        view.addSubview(button)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 200),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            button.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            button.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 60),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.image = UIImage(named: "placeholder")
        avatarImageView.contentMode = .scaleAspectFill
        
        button.setTitle("設定照片", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(presentPhotosVC), for: .touchUpInside)
    }
    
    @objc func presentPhotosVC() {
        let photosVC = PhotosVC()
        photosVC.delegate = self
        present(photosVC, animated: true)
    }
}

extension ViewController: PhotosVCDelegate {
    func photoselected(photo: UIImage) {
        avatarImageView.image = photo
    }
    
    
}

