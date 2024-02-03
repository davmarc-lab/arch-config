# Arch rice using i3

Hello, this is my first rice of arch using i3 window manager. I know it's pretty basic but I have not much confidence and knowledge of this things

<!--toc:start-->
- [Arch rice using i3](#arch-rice-using-i3)
  - [Images](#images)
    - [Alacritty](#alacritty)
    - [Neovim](#neovim)
    - [Spicetify theme](#spicetify-theme)
  - [What I've done](#what-ive-done)
  - [I'm currently working on](#im-currently-working-on)
  - [Additional info](#additional-info)
<!--toc:end-->

## Images

![image](assets/Desktop.png)

### Alacritty

![image](assets/Consoles.png)

### Neovim

![image](assets/nvim-1.png)

![image](assets/nvim-2.png)

### Spicetify theme

![image](assets/spotify-theme.png)

## What I've done

In these configuration files you will find:

- Neovim configuration using Lazy plugin manager and Mason
- i3 with custom keybinds and settings
- Polybar configuration, even if is pretty standard
  (you can change the bar in the i3 config file and it will set a themed bar)
- Thunar config files (they still need work right now)
- Some bash aliases and ohmyposh configuration for a cool command line
- Alacritty configuration
- All my installed fonts
- Glava config for audio visualizer in all workspaces
- X11 configuration to start i3 window manager
- My spotify theme using spicetify
- Notifications using dunst daemon

## I'm currently working on

- [x] upgrading polybar style and design
- [x] fixing neovim configuration because it's still not perfect but usable
- [ ] implementing more feature with i3
- [ ] better audio configuration
- [ ] findig a best way to use doom theme in nvim
- [ ] customize Thunar file explorer

## Additional info

For nvim configuration i've used the startup nvim plugin to have a startup screen.
I've created my own theme in the plugin folder and added a file named `doom.lua`, with
the configuration for the DOOM text. (kinda brute forced)
