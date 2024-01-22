//
//  ViewController.swift
//  project1
//
//  Created by хех on 01.01.2024.
//

import UIKit
import WebKit

    class ViewController: UIViewController{

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=51835022&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token") else { return }
            myWeb.load(URLRequest(url: url))
            setupUI()
        }
        
        private lazy var myWeb: WKWebView = {
            let myWeb = WKWebView(frame: view.bounds)
            myWeb.navigationDelegate = self
            return myWeb
        }()


        private func setupUI() {
            view.addSubview(myWeb)
//            addConstrains()
        }

//        private func addConstrains() {
//            NSLayoutConstraint.activate([
//            ])
//        }
    }
private extension ViewController {
    func tap() {
        let tab1 = UINavigationController(rootViewController: FriendsView())
        let tab2 = UINavigationController(rootViewController: GroupsView())
        let tab3 = UINavigationController(rootViewController: PhotosView(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tab1.tabBarItem.title = "Friendssssss"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"
        
        
        let arrayOfTabs = [tab1, tab2, tab3]
        let tapBarController = UITabBarController()
        tapBarController.viewControllers = arrayOfTabs
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
                  return
              }
        firstWindow.rootViewController = tapBarController
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void){
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
                    decisionHandler(.allow)
                    return
                    }
                let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=")}
                    .reduce([String: String]()) {result, parameter in
                        var dictionary = result
                        let key = parameter[0]
                        let value = parameter[1]
                        dictionary[key] = value
                        return dictionary
                }
        NetworkServiceClass.networkToken = params["access_token"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }

}
//#Preview{
//    ViewController()
//}




