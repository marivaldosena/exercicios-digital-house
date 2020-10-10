//
//  PeopleListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation
import UIKit

//MARK: - ComposerListViewController
extension ComposerListViewController {
    static func getNavigationController() -> UINavigationController? {
        if let uiNavigationController = UIStoryboard(name: K.ViewNames.Composers.composerListName, bundle: nil).instantiateInitialViewController() as? UINavigationController {
            return uiNavigationController
        }
        
        return nil
    }
    
    static func getViewController() -> ComposerListViewController? {
        guard let uiNavigationController = self.getNavigationController() else {
            return nil
        }
        
        guard let viewController = uiNavigationController.topViewController as? ComposerListViewController else {
            return nil
        }
        
        return viewController
    }
    
    func updateUIInterface() {
        let composer = self.getRepository().getActiveItem()
        composerListCollectionView?.reloadData()
        
        if let composer = composer {
            seeDetailsImageView?.isHidden = false
            selectedComposerNameLabel?.text = composer.name
        } else {
            seeDetailsImageView?.isHidden = true
        }
    }
    
    func openWebEncyclopedia(term: String) {
        let normalizedTerm = WebUtils.getNormalizeQueryParameters(queryParam: term)
        let url = "\(K.WebBrowser.webEncyclopediaUrl)/w/index.php?search=\(normalizedTerm)"
        
        do {
            try WebUtils.openURL(url: url)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func openVideoStreamingPlatform(term: String) {
        let normalizedTerm = WebUtils.getNormalizeQueryParameters(queryParam: term)
        let url = "https://www.youtube.com/results?search_query=\(normalizedTerm)"
        
        do {
            try WebUtils.openURL(url: url)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func goToRoot() {
        dismiss(animated: true, completion: nil)
    }
    
    private func goToComposerDetail() {
        if let viewController = ComposerDetailViewController.getViewController() {
            let repository = self.getRepository()
            viewController.setRepository(repository: repository)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @objc private func gestureRecognizerHandler(handler: UITapGestureRecognizer) {
        if let tappedImageView = handler.view as? UIImageView {
            let selectedComposer = self.getRepository().getActiveItem()
            
            switch tappedImageView {
            case seeDetailsImageView:
                self.goToComposerDetail()
            case webEncyclopediaImageView:
                self.openWebEncyclopedia(term: selectedComposer?.name ?? "Classical Music")
            case videoStreamingPlatformImageView:
                self.openVideoStreamingPlatform(term: selectedComposer?.name ?? "Classical Music")
            default:
                break
            }
        }
    }
    
    private func setGestureHandler(to sender: UIImageView?, _ gestureRecognizer: UITapGestureRecognizer) {
        sender?.addGestureRecognizer(gestureRecognizer)
        sender?.isUserInteractionEnabled = true
    }
    
    private func getGestureRecognizer() -> UITapGestureRecognizer {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizerHandler(handler:)))
        
        return gestureRecognizer
    }
    
    func addGestureHandlerToImages() {
        self.setGestureHandler(to: webEncyclopediaImageView, self.getGestureRecognizer())
        self.setGestureHandler(to: seeDetailsImageView, self.getGestureRecognizer())
        self.setGestureHandler(to: videoStreamingPlatformImageView, self.getGestureRecognizer())
    }
}

//MARK: - ComposerListViewController: UICollectionViewDelegate
extension ComposerListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let composer = self.getRepository().getItem(at: indexPath.row)
        
        self.getRepository().setActiveItem(item: composer)
        self.updateUIInterface()
    }
}

//MARK: - ComposerListViewController: UICollectionViewDataSource
extension ComposerListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getRepository().getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ComposerListCollectionViewCell.getCellInstance(collectionView, indexPath)
        let person = self.getRepository().getItem(at: indexPath.row)
        cell.setup(item: person)
        
        return cell
    }
}
