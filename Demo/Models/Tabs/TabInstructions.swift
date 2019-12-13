//
//  TabInstructions.swift
//  Demo
//
//  Created by wangyongyue on 2019/12/10.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class TabInstructions: Configuration {
    
    override init() {
        super.init()
        
       
        Vue.register(aClass: Nav101Model.classForCoder(), toClass: Nav101.classForCoder())
        Vue.register(aClass: Nav102Model.classForCoder(), toClass: Nav102.classForCoder())
        Vue.register(aClass: Nav103Model.classForCoder(), toClass: Nav103.classForCoder())

       
        
        Vue.register(aClass: Content101Model.classForCoder(), toClass: Content101.classForCoder())
        Vue.register(aClass: Content102Model.classForCoder(), toClass: Content102.classForCoder())
        Vue.register(aClass: Content103Model.classForCoder(), toClass: Content103.classForCoder())
        Vue.register(aClass: Content104Model.classForCoder(), toClass: Content104.classForCoder())
        Vue.register(aClass: Content105Model.classForCoder(), toClass: Content105.classForCoder())
        Vue.register(aClass: Content106Model.classForCoder(), toClass: Content106.classForCoder())
        Vue.register(aClass: Content107Model.classForCoder(), toClass: Content107.classForCoder())
        
        Vue.register(aClass: ContentSub101Model.classForCoder(), toClass: ContentSub101.classForCoder())
        Vue.register(aClass: ContentSub102Model.classForCoder(), toClass: ContentSub102.classForCoder())
        Vue.register(aClass: ContentSub103Model.classForCoder(), toClass: ContentSub103.classForCoder())
        Vue.register(aClass: ContentSub104Model.classForCoder(), toClass: ContentSub104.classForCoder())
        
        
        Vue.register(aClass: Content201Model.classForCoder(), toClass: Content201.classForCoder())
        Vue.register(aClass: Content202Model.classForCoder(), toClass: Content202.classForCoder())
        Vue.register(aClass: Content203Model.classForCoder(), toClass: Content203.classForCoder())

        Vue.register(aClass: Content301Model.classForCoder(), toClass: Content301.classForCoder())
        Vue.register(aClass: Content302Model.classForCoder(), toClass: Content302.classForCoder())
        Vue.register(aClass: Content303Model.classForCoder(), toClass: Content303.classForCoder())

        
        Vue.register(aClass: Setup101Model.classForCoder(), toClass: Setup101.classForCoder())
        Vue.register(aClass: Setup102Model.classForCoder(), toClass: Setup102.classForCoder())
        Vue.register(aClass: Setup103Model.classForCoder(), toClass: Setup103.classForCoder())
        
        Vue.register(aClass: MTextModel.classForCoder(), toClass: MText.classForCoder())
        Vue.register(aClass: MTitleModel.classForCoder(), toClass: MTitle.classForCoder())
        Vue.register(aClass: MSpaceModel.classForCoder(), toClass: MSpace.classForCoder())

        Vue.register(aClass: MWordModel.classForCoder(), toClass: MWord.classForCoder())
        Vue.register(aClass: MBlanksModel.classForCoder(), toClass: MBlanks.classForCoder())
        Vue.register(aClass: MBlanksSubModel.classForCoder(), toClass: MBlanksSub.classForCoder())
        Vue.register(aClass: MPunctuationModel.classForCoder(), toClass: MPunctuation.classForCoder())
        Vue.register(aClass: MSelectModel.classForCoder(), toClass: MSelect.classForCoder())
        Vue.register(aClass: MSelectSubModel.classForCoder(), toClass: MSelectSub.classForCoder())

        

        
    }

    override func getTabBar() -> UIViewController{
         
      let tab = BaseTabBarController()
        tab.addChildVC(childVC: Tab100().v_viewController(), childTitle: "tab1", image: UIImage.init(named: "home"), selectedImage: UIImage.init(named: "home"))
      tab.addChildVC(childVC: Tab200().v_viewController(), childTitle: "tab2", image: UIImage.init(named: "message"), selectedImage: UIImage.init(named: "message"))
      tab.addChildVC(childVC: Tab300().v_viewController(), childTitle: "tab3", image: UIImage.init(named: "mine"), selectedImage: UIImage.init(named: "mine"))

      return tab
     }
    
    override func themeColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 208/255.0, blue: 95/255.0, alpha: 1.0)
    }
    
    override func backgroundColor() -> UIColor{
//        return UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        return UIColor.white

    }
    override func tabBarBackgroundColor() -> UIColor{
        return UIColor.white
    }
    override func tabBarColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 208/255.0, blue: 95/255.0, alpha: 1.0)
    }
    override func navigtaionBackgroundColor() -> UIColor{
        return UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    override func navigtaionTextColor() -> UIColor{
        return UIColor.black
    }
    override func statusColor() -> UIColor{
        return UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    override func  menuColor() -> UIColor{
          return UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
}
