import UIKit

class MovieCell: UITableViewCell {

    static let id = "MovieCell"

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblPlayList: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(movieDetails: MovieDetails){
        lblName.text = movieDetails.title
        lblRating.text = "Rating: \(movieDetails.vote_average)"
        imgMovie.dm_setImage(posterPath: movieDetails.poster_path)

        var arrPlayListContained : [String] = []
        let arrPlayLists : [String] = UserDefaults.standard.object(forKey: "PlayLists") as? [String] ?? []
        for playList in arrPlayLists{
            let arrids : [Int] = UserDefaults.standard.object(forKey: playList) as? [Int] ?? []
            if arrids.contains(movieDetails.id){
                arrPlayListContained.append(playList)
            }
        }
        lblPlayList.text = arrPlayListContained.reduce("", { partialResult, value in
            return partialResult + value
        })
    }
    
    @IBAction func btnFavoriteClicked(){
        
        
    }
}

