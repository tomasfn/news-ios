# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def news_pods
  pod 'SDWebImage'
  pod 'Moya'
  pod 'MaterialComponents'
end

target 'News' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  news_pods

  target 'NewsTests' do
    inherit! :search_paths
        news_pods
  end

  target 'NewsUITests' do
    news_pods
  end

end
