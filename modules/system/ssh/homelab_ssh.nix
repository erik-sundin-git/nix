{
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = false; #change to false after setting up keys
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
