//
//  AudioViewController.swift
//  Navigation
//
//  Created by Vadim on 05.06.2022.
//

import UIKit
import AVFoundation
import AVKit

class AudioViewController: UIViewController {
    
    private let coordinator: AudioCoordinator?
    private let viewModel: AudioViewModel?
    private var player: AVAudioPlayer!
    private var switchTrack: Int = 0
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.imageView?.tintColor = .black
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)),
                        for: .normal)
        button.addTarget(self, action: #selector(playTrack), for: .touchUpInside)
        return button
    }()
    
    lazy var stopButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.imageView?.tintColor = .black
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "stop.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.addTarget(self, action: #selector(stopTrack), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.imageView?.tintColor = .black
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "forward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)),
                        for: .normal)
        button.addTarget(self, action: #selector(nextTrack), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.imageView?.tintColor = .black
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "backward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)),
                        for: .normal)
        button.addTarget(self, action: #selector(backTrack), for: .touchUpInside)
        return button
    }()
    
    lazy var stackButton: UIStackView = {
        let button = UIStackView()
        button.toAutoLayout()
        button.axis = .horizontal
        button.distribution = .fillEqually
        button.spacing = 0
        button.addArrangedSubview(backButton)
        button.addArrangedSubview(playButton)
        button.addArrangedSubview(stopButton)
        button.addArrangedSubview(nextButton)
        return button
    }()
    
    lazy var titleTrackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var artistTrackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageTrack: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    init(coordinator: AudioCoordinator?,
         viewModel: AudioViewModel?) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Music"
        setupConstraints()
        guard let viewModel = viewModel?.audioLibrary else { return }
        player = try?AVAudioPlayer(contentsOf: (viewModel.first?.url)!)
        titleTrackLabel.text = viewModel.first?.title
        artistTrackLabel.text = viewModel.first?.artist
        imageTrack.image = UIImage(named: viewModel.first?.image ?? "")
        player.prepareToPlay()
    }
    
    private func setupConstraints() {
        view.addSubviews(stackButton, titleTrackLabel, artistTrackLabel, imageTrack)
        
        NSLayoutConstraint.activate([
            stackButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            stackButton.heightAnchor.constraint(equalToConstant: 150),
            
            titleTrackLabel.bottomAnchor.constraint(equalTo: stackButton.topAnchor, constant: -20),
            titleTrackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            artistTrackLabel.topAnchor.constraint(equalTo: titleTrackLabel.bottomAnchor, constant: 10),
            artistTrackLabel.centerXAnchor.constraint(equalTo: titleTrackLabel.centerXAnchor),
            
            imageTrack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageTrack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            imageTrack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageTrack.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32)
        ])
    }
    
    @objc func playTrack() {
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "pause.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        }
        
        player.play()
        playButton.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
    }
    
    @objc func stopTrack() {
        stopButton.setImage(UIImage(systemName: "stop.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.gray), for: .selected)
        player.stop()
        player.currentTime = 0
    }
    
    @objc func nextTrack() {
        guard let viewModel = viewModel?.audioLibrary else { return }
        if switchTrack == viewModel.count - 1 {
            switchTrack = 0
        } else {
            switchTrack += 1
        }
        player = try?AVAudioPlayer(contentsOf: (viewModel[switchTrack].url)!)
        titleTrackLabel.text = viewModel[switchTrack].title
        artistTrackLabel.text = viewModel[switchTrack].artist
        imageTrack.image = UIImage(named: viewModel[switchTrack].image ?? "")
        player.prepareToPlay()
        player.play()
    }
    
    @objc func backTrack() {
        guard let viewModel = viewModel?.audioLibrary else { return }
        if switchTrack == 0 {
            switchTrack = viewModel.count - 1
        } else {
            switchTrack -= 1
        }
        player = try?AVAudioPlayer(contentsOf: (viewModel[switchTrack].url)!)
        titleTrackLabel.text = viewModel[switchTrack].title
        artistTrackLabel.text = viewModel[switchTrack].artist
        imageTrack.image = UIImage(named: viewModel[switchTrack].image ?? "")
        player.prepareToPlay()
        player.play()
    }
}
