{config, pkgs, ...}:{
    programs.niri.enable=true;

    environment.systemPackages = with pkgs; [
        waybar
        fuzzel
        mako
        swaybg
        swayidle
        xwayland-satellite
    ];
}
