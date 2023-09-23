import Foundation

class MovieDetails: Codable{
    
    private(set) var id : Int
    private(set) var original_title : String
    private(set) var title : String
    private(set) var vote_average: Double
    private(set) var poster_path : String

}
