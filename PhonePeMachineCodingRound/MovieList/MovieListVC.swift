import UIKit



class MovieListVC: UIViewController {

    static let id = "MovieListVC"
    private var arrMovies : [MovieDetails]?
    @IBOutlet weak var tblMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getMovies()
    }
    
    private func setupUI(){
        self.navigationItem.title = "All Movies"

        tblMovies.register(UINib(nibName: MovieCell.id, bundle: nil), forCellReuseIdentifier: MovieCell.id)
        tblMovies.separatorStyle = .none
        tblMovies.showsVerticalScrollIndicator = false
    }
    
    private func getMovies(){
        do{
            self.arrMovies = try JSONDecoder().decode([MovieDetails].self, from: UtilityHelper.strJSON.data(using: .utf8) ?? Data())
            self.tblMovies.reloadData()
        }catch let error{
            print(error)
        }
        
    }
}

extension MovieListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.id, for: indexPath) as? MovieCell, let arrMovies = arrMovies, indexPath.row < arrMovies.count{
            let details = arrMovies[indexPath.row]
            cell.configure(movieDetails: details)
            cell.btnFavorite.tag = indexPath.row
            cell.btnFavorite.addTarget(self, action: #selector(self.btnFavClicked(sender:)), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func btnFavClicked(sender: UIButton){
        
        let arrPlayLists = UserDefaults.standard.getPlayLists()
        
        let alertController = UIAlertController(title:"Select PlayList" , message: "", preferredStyle: .actionSheet)
        
        for playList in arrPlayLists{
            
            let okAction = UIAlertAction(title: playList, style: UIAlertAction.Style.destructive) {
                UIAlertAction in
                
                if let movieDetails = self.arrMovies?[sender.tag]{
                    var arrmovieids: [Int] = UserDefaults.standard.getMoviesInPlayList(key: playList)
                    arrmovieids.append(movieDetails.id)
                    UserDefaults.standard.set(arrmovieids, forKey: playList)
                    self.tblMovies.reloadData()
                }
                
            }
            alertController.addAction(okAction)
        }
        let okAction = UIAlertAction(title: "New PlayList", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            
            let alert = UIAlertController(title: "New PlayList", message: "", preferredStyle: .alert)
            alert.addTextField { (textField:UITextField) in
                textField.placeholder = "Enter Name"
                textField.keyboardType = .default
            }
            self.present(alert, animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
}
