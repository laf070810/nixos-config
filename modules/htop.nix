{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.htop = {
    enable = true;
    settings = {
      hide_kernel_threads = true;
      hide_userland_threads = true;
      column_meters_0 = "CPU Memory Swap DiskIO NetworkIO ZFSARC";
      column_meter_modes_0 = "1 1 1 2 2 2";
      column_meters_1 = "Tasks LoadAverage Uptime Systemd SystemdUser SELinux";
      column_meter_modes_1 = "2 2 2 2 2 2";
      "screen:Main" = "PID USER SESSION PGRP PPID PRIORITY OOM NICE STATE NLWP PERCENT_CPU PERCENT_MEM M_VIRT M_RESIDENT M_SHARE IO_READ_RATE IO_WRITE_RATE STARTTIME TIME Command";
      # "screen:I/O" = "PID USER IO_PRIORITY IO_RATE IO_READ_RATE IO_WRITE_RATE PERCENT_SWAP_DELAY PERCENT_IO_DELAY Command";
      sort_key = 46;
      tree_sort_key = 2;
      sort_direction = -1;
    };
  };
}
