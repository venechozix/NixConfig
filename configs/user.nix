{ config, pkgs, ... }: {

    users.defaultUserShell = pkgs.zsh;

    users.users.chozix = {
        isNormalUser = true;
        description = "Jesus";
        extraGroups = [ "networkmanager" "wheel" "syncthing" ];
        packages = with pkgs; [
            kdePackages.kate
            #  thunderbird
        ];
  };

}
