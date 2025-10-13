{config, pkgs, ...}:{
    programs.niri.enable=true;
    
    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs ; [
        xdg-desktop-portal-gtk  
        kdePackages.xdg-desktop-portal-kde
    ];

    environment.systemPackages = with pkgs; [
        waybar
        fuzzel
        mako
        swaybg
        swayidle
        xwayland-satellite
    ];
}
