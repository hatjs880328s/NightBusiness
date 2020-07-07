source 'https://github.com/CocoaPods/Specs.git'
# use_frameworks!

platform :ios, '9.0'

target 'NightBusiness' do
    pod 'FMDB',                   '2.6.2'
    pod 'MJExtension',            '3.2.1'
    pod 'MBProgressHUD',          '1.2.0'
    pod 'SDWebImage',             '5.0.0'
    pod 'Bugly',                  '2.5.0'

    # swift initialization
    pod 'RxSwift',                '5.0.0'
    pod 'RxCocoa',                '5.0.0'
    pod 'RxRelay',                '5.0.0'
    pod 'HandyJSON',              '5.0.0'
    pod 'SwiftyJSON',             '5.0.0'
    pod 'SnapKit',                '4.2.0'

    pod 'IISwiftBaseUti',         '1.4.0'
    pod 'IISecurity',             '0.5.6'
    pod 'IIHTTPRequest',          '2.0.8'
    pod 'IIBaseComponents',       '0.1.3'
    pod 'IIComponents',           '0.3.4'
    pod 'IIOCUtis',               '2.0.0'
    pod 'IIBLL',                  '0.4.4'
    pod 'IINETObserver',          '1.0.0'

    # swift old progject should not set tag
    pod 'II18N'
    pod 'IIAOPNBP'
    pod 'IIUIAndBizConfig'

    # 高德地图
    pod 'TencentMap-SDK'
    pod 'WechatOpenSDK',          '1.8.6.2'

    pod 'Hero'

end

