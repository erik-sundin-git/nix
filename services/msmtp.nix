{ pkgs, lib, ... }:

{
  programs.msmtp = {
  enable = true;
  accounts.default = {
    tls = true;
    host = "smtp.protonmail.ch";
    port = "587";
    from = "mail@eriksundin.com";
    user = "mail@eriksundin.com";
    password = "SKUDAW4NR88CP8DE";
  };
};
}
