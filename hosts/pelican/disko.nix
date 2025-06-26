{ ... }:

{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/wwn-0x5ace42e020095507";
      content = {
        type = "gpt";

        partitions.boot = {
          name = "boot";
          size = "1M";
          type = "EF02";
        };

        partitions.esp = {
          name = "ESP";
          size = "500M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        partitions.root = {
          size = "100%";
          content = {
            type = "btrfs";

            subvolumes."@root" = {
              mountpoint = "/";
            };

            subvolumes."@home" = {
              mountpoint = "/home";
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
            };

            subvolumes."@nix" = {
              mountpoint = "/nix";
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
            };
          };
        };
      };
    };

    # disk.storage1 = {
    #   type = "disk";
    #   device = "/dev/disk/by-id/wwn-0x50014ee25e5d877b";
    #   content = {
    #     type = "gpt";
    #     partitions.zfs = {
    #       size = "100%";
    #       content = {
    #         type = "zfs";
    #         pool = "storage";
    #       };
    #     };
    #   };
    # };
    #
    # disk.storage2 = {
    #   type = "disk";
    #   device = "/dev/disk/by-id/wwn-0x50014ee265b7177d";
    #   content = {
    #     type = "gpt";
    #     partitions.zfs = {
    #       size = "100%";
    #       content = {
    #         type = "zfs";
    #         pool = "storage";
    #       };
    #     };
    #   };
    # };

    # zpool.storage = {
    #   type = "zpool";
    #   mode = "mirror";
    #
    #   datasets.dataset = {
    #     type = "zfs_fs";
    #     mountpoint = "/storage";
    #   };
    # };
  };
}
