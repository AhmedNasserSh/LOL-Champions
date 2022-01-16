source 'https://github.com/CocoaPods/Specs.git'
platform :ios , 15.0
use_frameworks!
workspace 'LOLChampions'

def app_pods
pod 'SwiftLint'
pod 'Swinject'
end


target 'LOLChampions' do
project 'LOLChampions/LOLChampions.project'
app_pods
target 'LOLChampionsTests' do
    pod 'Swinject'
end

end

target 'Common' do
project 'Common/Common.project'
app_pods

target 'CommonTests' do
    pod 'Swinject'
end
end

target 'AppCoordinator' do
project 'AppCoordinator/AppCoordinator.project'
app_pods
target 'AppCoordinatorTests' do
    pod 'Swinject'
end
end

target 'NetworkManger' do
project 'NetworkManger/NetworkManger.project'
app_pods
target 'NetworkMangerTests' do
    pod 'Swinject'
end
end

target 'Home' do
project 'features/Home/Home.project'
app_pods
target 'HomeTests' do
    pod 'Swinject'
end
end

target 'ChampionDetails' do
project 'features/ChampionDetails/ChampionDetails.project'
app_pods
target 'ChampionDetailsTests' do
    pod 'Swinject'
end
end




