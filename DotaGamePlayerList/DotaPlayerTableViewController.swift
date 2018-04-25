//
//  ViewController.swift
//  DotaGamePlayerList
//
//  Created by Macbook Pro on 24/04/18.
//  Copyright © 2018 tofiqueahmedkhan. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class DotaPlayerTableViewController: UITableViewController {
    
    //MARK: - Constant and Variables
    var heroes = [HeroStats]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "playerCell")
        
        downloadPlayerJSON {
            self.tableView.reloadData()
        }
        
    }
    //MARK: - Delegate Method of TableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToPlayerDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlayersDetailViewController{
            destination.hero = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    //MARKS: - DataSource Method of TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        cell.playerName.text = heroes[indexPath.row].localized_name
        cell.playerAttack.text = heroes[indexPath.row].attack_type
        let imageURL = "https://api.opendota.com"+heroes[indexPath.row].img
        let url = URL(string: imageURL)
        cell.playerImage.downloadedFrom(url: url!)
        return cell
    }
    
    //MARK: - Networking and JSON
    
    func downloadPlayerJSON(completed: @escaping () -> ()){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("JSON Error \(error)")
                }
            }
        }.resume()
    }
    
}

