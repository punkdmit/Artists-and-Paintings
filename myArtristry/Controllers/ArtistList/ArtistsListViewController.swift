//
//  ViewController.swift
//  myArtristry
//
//  Created by Dmitry Apenko on 29.06.2022.
//

import UIKit

class ArtistsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var listOfArtists = [Artist]()
    private let artistLoader = ArtistLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ArtistCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        artistLoader.loadArtists() { [weak self] in
            self?.listOfArtists = $0
            self?.tableView.reloadData()
        }
    }
}

extension ArtistsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfArtists.count
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
//        UIStoryboard(name: "", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailScreen")
//        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "detailScreen") { (coder) -> UIViewController? in
//            WorksListViewController(selectedArtist: self.listOfArtists[indexPath.row])
//        }
        let vc = WorksListViewController(selectedArtist: listOfArtists[indexPath.row])
        //        let vc = WorksListViewController(atrist: listOfArtists[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ArtistCell
        else { return UITableViewCell() }
        let artist = listOfArtists[indexPath.row]
        cell.titleLabel?.text = artist.name
        cell.descriptionLabel?.text = artist.bio
        cell.photoImageView?.image = UIImage(named: artist.image)
        return cell
    }
}
