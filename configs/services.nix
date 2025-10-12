{ config, pkgs, ... }: {

    #Syncthing
    #Todo: Move this to its own file and make the extended config
    services = {
        syncthing = {
            enable = true;
            group = "syncthing";
            user = "chozix";
            dataDir = "/home/chozix/";    # Default folder for new synced folders
            configDir = "/home/chozix/.config/syncthing";   # Folder for Syncthing's settings and keys
        };
    };
}
