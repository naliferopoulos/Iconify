# Iconify - An OSX utility to add a custom icon on your status bar
## How does it work?
*Iconify* is an agent application (that means it runs without an app icon). It places an icon of your choice (usually 20*20 pixels, so that it fits) on the status bar. It can also display a custom tooltip that you choose when hovering over the icon.
## How do I customize it?
*Iconify* needs two main files to run:
** iconify.png ** - The icon that is displayed
** settings.plist ** - A property list containing the key **Text**, the value of which is diplayed as a tooltip.
Both files need to be in /Library/Application Support/Iconify. Just create the folder and place them in! Simple as that! :)

### Iconify is made with <3 and Xcode by Nick Aliferopoulos (aliferopoulos@icloud.com)
