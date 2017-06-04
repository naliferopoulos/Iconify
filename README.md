# Iconify - An OSX utility to add a custom icon on your status bar
## How does it work?
*Iconify* is an agent application (that means it runs without an app icon). It places an icon of your choice (usually 20*20 pixels, so that it fits) on the status bar. It can also display a custom tooltip that you choose when hovering over the icon.
## How do I customize it?
*Iconify* needs three main files to run:
* iconify.png  - The icon that is displayed.
* iconify_large.png - The icon that is displayed on the notification when clicked.
* settings.plist  - A property list containing the following keys:
    ** [String]Tooltip - The tooltip displayed when hovering over the icon.
    ** [String]Text - The text of the notification that is displayed when clicking the icon.
    ** [String]Subtext - The text of the notification that is displayed when clicking the icon.
    ** [String]Display - Determines wether a notification should display when clicking the icon.
    ** [String]Exit - Determines wether Iconify can be shut down using control+click.
All files need to be in /Library/Application Support/Iconify. Just create the folder and place them in! Simple as that! :)

### Iconify is made with <3 and Xcode by Nick Aliferopoulos (aliferopoulos@icloud.com)
