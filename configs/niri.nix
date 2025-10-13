{config, pkgs, ...}:{
    programs.niri.enable=true;
    
    services.gnome.gnome-keyring.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs ; [
        xdg-desktop-portal-gtk  
        xdg-desktop-portal-gnome
    ];

    environment.systemPackages = with pkgs; [
        nautilus
        waybar
        fuzzel
        mako
        swaybg
        swayidle
        xwayland-satellite
    ];
}
