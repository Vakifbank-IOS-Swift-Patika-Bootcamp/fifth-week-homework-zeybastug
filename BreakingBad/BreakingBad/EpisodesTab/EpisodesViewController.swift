//
//  EpisodesViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 26.11.2022.
//

import UIKit

class EpisodesViewController: UIViewController {
        
    @IBOutlet weak var episodeTableView: UITableView!
    
    var episode = ServiceOperations()
    
    static var episodeList:[EpisodeModel] = []
    
    @IBOutlet weak var innerTableView: EpisodesCharactersView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episode.episodeVC = self
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        
        episode.getEpisodeData()
    }
}

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EpisodesViewController.episodeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeTableViewCell
          
        cell.seasonLabel.text = EpisodesViewController.episodeList[indexPath.row].season
        cell.episodeLabel.text = EpisodesViewController.episodeList[indexPath.row].episode
        cell.titleLabel.text =  EpisodesViewController.episodeList[indexPath.row].title
        cell.dateLabel.text =   EpisodesViewController.episodeList[indexPath.row].air_date
          
          return cell
    }
    
    private func tableView(_ tableView: UITableViewDelegate, didSelectRowAt indexPath: IndexPath) {
        let episode = EpisodesViewController.episodeList[indexPath.row]

        
        innerTableView.isHidden = false
        //episodeCharactersView.layer.zPosition = 2
        
      // episodeCharactersLabel.text = episodeList[indexPath.row].characters
       
    }
    
    
    
    
    
    
}

