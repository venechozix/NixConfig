{config, pkgs, ...}:{
    programs.niri.enable=true;
    
    services.gnome.gnome-keyring.enable = true;
    security.polkit.enable = true;

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs ; [
            xdg-desktop-portal-gtk  
            xdg-desktop-portal-gnome
        ];
        xdgOpenUsePortal = true;
    };

#   environment.sessionVariables = {
#       # 1. Forces native Wayland
#       SDL_VIDEODRIVER = "wayland"; 

#       # 2. Crucial fix: Disables the GTK-style title bar (libdecor)
#       SDL_VIDEO_WAYLAND_PREFER_LIBDECOR = "0"; 
#   };

    environment.systemPackages = with pkgs; [
        swww
        wlr-randr
        nautilus
        waybar
        fuzzel
        mako
        swaybg
        swayidle
        xwayland-satellite
    ];
}
