
inhibit_all_warnings!
platform :ios, '12.0'
use_frameworks!



def core_pods
  pod 'Alamofire', '5.2.2'
pod 'Kingfisher', '5.15.5'
pod 'Swinject', '2.7.1'
pod 'SwiftLint'
pod 'Disk', '0.6.4'
pod 'MaterialComponents/ActivityIndicator', '117.0.0'

end

target 'Test-Project' do
  core_pods
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
end
