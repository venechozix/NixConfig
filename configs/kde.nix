{config, pkgs, ...}:{
    
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;


    services.xserver.xkb = {
    layout = "us";
    variant = "";
    };
    services.desktopManager.plasma6.enable = true;
}
