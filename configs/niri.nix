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
