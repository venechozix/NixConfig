{config, pkgs, ...}:{
    programs.niri.enable=true;

    environment.systemPackages = with pkgs; [
        waybar
        wofi
        mako
        swaybg
        swayidle
    ];
}
