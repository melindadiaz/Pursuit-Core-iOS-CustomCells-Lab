import UIKit

class ViewController: UIViewController {
    //TODO: Populate cells, Fix the problem of creating collection cells
    
    var mainView = MainView()
    
    private var peoplePhoto = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
            
        }
    }
    
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = "People"
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        setUp()
    }
    
    func setUp() {
        
        UsersFetchingService.manager.getUsers { [weak self] (result) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "cannot get users!! oh no! \(error)")
                }
            case .success(let data):
                self?.peoplePhoto = data
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peoplePhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            fatalError("could not downcast to PeopleCell")}
        cell.configureCell(instance: peoplePhoto[indexPath.row])
        cell.backgroundColor = .systemPink
        return cell
        
    }
    
    
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.95 // 95% of the width of device
        return CGSize(width: itemWidth, height:  UIScreen.main.bounds.size.height * 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = peoplePhoto[indexPath.row]
        
        let peopleDetailedStoryBoard = UIStoryboard(name: "PeopleDetail", bundle: nil)//bundle is all the resources you have in your application
        
        guard let peopleDetailController = peopleDetailedStoryBoard.instantiateViewController(identifier: "PeopleDetailController") as? PeopleDetailController else {
            fatalError("could not downcast to peopleDetailViewController")
        }
        peopleDetailController.people = photo
        //we will pass data using initializers/ dependency injection later in the weeks
        navigationController?.pushViewController(peopleDetailController, animated: true)
        
    }
    
}

