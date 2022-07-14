//
//  ArtistsDetailViewController.swift
//  myArtristry
//
//  Created by Dmitry Apenko on 30.06.2022.
//

import Foundation
import UIKit
class WorksListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var selectedArtist: Artist

    init(selectedArtist: Artist) {
        self.selectedArtist = selectedArtist
        super.init(nibName: "WorksListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WorkCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension WorksListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? WorkCell
        else { return UITableViewCell() }
        let work = selectedArtist.works[indexPath.row]
        cell.pictureImageView?.image = UIImage(named: work.image)
        cell.titleLabel?.text = work.title
        cell.descriptionLabel?.text = work.info
        return cell
    }
}
