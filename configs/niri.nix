{config, pkgs, ...}:{
    programs.niri.enable=true;

    
    environment.variables = {
      XCURSOR_THEME = "Twilight-Cursors";
      XCURSOR_SIZE = "24";
    };

    environment.systemPackages = with pkgs; [
        waybar
        fuzzel
        mako
        swaybg
        swayidle
        xwayland-satellite
    ];
}
