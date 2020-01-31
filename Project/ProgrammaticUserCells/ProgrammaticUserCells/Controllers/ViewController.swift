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
        //TODO: put your function to call API here
    }

   

}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peoplePhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as?  PhotoCell  else {
               fatalError("could not downcast to PeopleCell")}
        cell.backgroundColor = .systemPink
        return cell
        
    }
    
    
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let maxSize: CGSize = UIScreen.main.bounds.size
          let itemWidth: CGFloat = maxSize.width * 0.95 // 95% of the width of device
          return CGSize(width: itemWidth, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = peoplePhoto[indexPath.row]
        
        let peopleDetailedStoryBoard = UIStoryboard(name: "PeopleDetail", bundle: nil)//bundle is all the resources you have in your application
        
        guard let peopleDetailController = peopleDetailedStoryBoard.instantiateViewController(identifier: "PeopleDetailController") as? PeopleDetailController else {
        fatalError("could not downcast to peopleDetailViewController")
        }
        peopleDetailController.people = photo
        //we will pass data using initializers/ dependency injecetion later in the weeks
        navigationController?.pushViewController(peopleDetailController, animated: true)
       
    }
    
}

