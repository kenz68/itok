# iTok


[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f73a48f33e314c88abef8b7a4dae85df)](https://www.codacy.com/app/nhoxbypass/EnglishNow?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=HCMUS-AssignmentWarehouse/EnglishNow&amp;utm_campaign=Badge_Grade

## User Stories

The basic **required** functionality:

* [x] Find a friend to practice speaking throught video call
* [x] Chatting with other friends in English

The **advance** features are implemented:

* [ ] Improve UI/UX


## Install libraries with Podfile

Launch terminal, cd to the project's folder and type ``pod install`` to install needed libraries for this app.
Then close XCode and open itok.xcodeworkspace to open it.

## Quick deploy to Heroku

Heroku is a PaaS (Platform as a Service) that can be used to deploy simple and small applications for free. To easily deploy **itok NodeJS server** repository to Heroku, sign up for a Heroku account and click this button:

<a href="https://heroku.com/deploy?template=https://github.com/opentok/learning-opentok-node/" target="_blank">
<img src="https://www.herokucdn.com/deploy/button.png" alt="Deploy">
</a>

Heroku will prompt you to add your OpenTok API key and OpenTok API secret, which you can
obtain at the [TokBox Dashboard](https://dashboard.tokbox.com/keys).

## Notes

This project use localdb combine with Firebase and NodeJS server, so it cannot provide any method to import data by Firebase JSON files. 
Tester **MUST** sign up and sign in in-app.

## Open-source libraries used

- [OpenTok](https://tokbox.com/) - Everything you need to build WebRTC
- [MBProgressHUD](https://github.com/jdg/MBProgressHUD) - iOS drop-in class that displays a translucent HUD with an indicator and/or labels while work is being done in a background thread.
- [SwiftMessages](https://github.com/SwiftKickMobile/SwiftMessages) - A very flexible message bar for iOS written in Swift.
- [Cosmos](https://github.com/evgenyneu/Cosmos) - A star rating control for iOS/tvOS written in Swift
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - A delightful networking framework for iOS, OS X, watchOS, and tvOS


## License

    itok is under the MIT license
