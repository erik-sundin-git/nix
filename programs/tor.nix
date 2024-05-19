{pkgs, lib, ...}:

services.tor = {
  enable = true;
  openFirewall = true;
  relay = {
    enable = true;
    role = "relay";
  };
  settings = {
    ContactInfo = "anemail@em.org";
    Nickname = "nick";
    ORPort = 9001;
    ControlPort = 9051;
    BandWidthRate = "1 MBytes";
  };
};


