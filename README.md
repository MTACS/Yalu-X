# Yalu X (Modified yalu102)

![Yalu logo](/Images/AppIcon.png)

A "work in progress" iOS jailbreak for 64-bit devices created by [qwertyoruiopz](https://twitter.com/qwertyoruiopz) and [marcograssi](marcograss).

**Modifications to yalu102 in this fork are done by MTAC, all other credit to qwertyoruiopz and marcograssi**

## Supported Devices and iOS versions

| Device | Version |
|---------|----------|
| iPad Pro  | iOS 10.0.0 -> iOS 10.2 |
| iPhone 6S  | iOS 10.0.0 -> iOS 10.2 |
| iPhone SE  | iOS 10.0.0 -> iOS 10.2 |
| iPhone 5S  | iOS 10.0.0 -> iOS 10.2 |
| iPad Air| iOS 10.0.0 -> iOS 10.2 |
| iPad Mini 2| iOS 10.0.0 -> iOS 10.2 |
| iPhone 6  | iOS 10.0.0 -> iOS 10.2 |
| iPad Mini 3| iOS 10.0.0 -> iOS 10.2 |
| iPad Air 2| iOS 10.0.0 -> iOS 10.2 |
| iPad Mini 4 | iOS 10.0.0 -> iOS 10.2 |
| iPod touch (6G)  | iOS 10.0.0 -> iOS 10.2 |

## Warnings

This jailbreak is a work in progress. Some things do not work, but most things do. iPhone 7 does not work with this specific fork of yalu102.

**As mentioned in the original fork, this is still a beta. Use at your own risk**

## Installation

For this specific fork of Yalu, download or use git clone, or use the .ipa file below with [Cydia Impactor](http://www.cydiaimpactor.com/)

[IPA](https://github.com/MTAC-Research/Yalu-X/raw/master/IPA/Yalu%20X.ipa)

## Fix for deleted Cydia, but /.installed_yaluX exists

I decided to add the fix here instead of on the device as if anything went wrong, I wouldn't want to be responible for any loss of a jailbreak.

**Steps to fix**

1. Connect to your device via SSH as root. For me on my MacBook, I use iPhoneTunnel, but any root SSH tunnel will work. You can also use something like iFunBox if you have installed Apple File Conduit 2. This can also be done through Filza if you do not have a computer. 

2. Browse to the / directory, and delete the /.installed_yaluX file. Over SSH it would be "cd / && rm .installed_yaluX" without quotes.

3. Visit http://apt.saurik.com/debs/cydia_1.1.30_iphoneos-arm.deb and download it. Place it in a directory you can remember, then run dpkg -i /path/to/cydia 1.1.30.deb as root. This will reinstall Cydia to your homescreen. If it doesn't appear, try running uicache as root over SSH. 
