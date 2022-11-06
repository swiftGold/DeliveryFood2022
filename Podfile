platform :ios, '13.0'

workspace 'DeliveryFood2022.xcworkspace'
project 'DeliveryFood2022.xcodeproj'

def networking_pod
    pod 'Networking', :path => 'DevPods/Networking'
end

def core_pod
    pod 'Core', :path => 'DevPods/Core'
end

def development_pods
  networking_pod
  core_pod
end

def common_pods
  use_frameworks!
  pod 'RealmSwift'
  pod 'SwiftGen'
end

target 'DeliveryFood2022' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DeliveryFood2022
  development_pods
  common_pods
end

target 'DeliveryFood2022Tests' do
  inherit! :search_paths
  # Pods for testing
end

target 'DeliveryFood2022UITests' do
  # Pods for testing
end

target 'Networking_Example' do
  use_frameworks!
  project 'DevPods/Networking/Example/Networking.xcodeproj'
  
  networking_pod
end

target 'Core_Example' do
  use_frameworks!
  project 'DevPods/Core/Example/Core.xcodeproj'
  
  core_pod
end
