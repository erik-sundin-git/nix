{
  pkgs,
  lib,
  config,
  ...
}: let
  stable-pkgs = import (fetchTarball {
    url = "https://releases.nixos.org/nixpkgs/24.05-darwin/nixpkgs-darwin-24.05pre633153.83bb0d311cc9/nixexprs.tar.xz";
  }) {};
in {
  programs.emacs = {
    enable = true;
    package = stable-pkgs.emacs;
    extraConfig = ''
      (add-to-list 'custom-theme-load-path "${config.home.homeDirectory}/.emacs.d/themes/")
      (load-theme 'tokyo t)

      ;; Set up package.el to work with MELPA
      (require 'package)
      (add-to-list 'package-archives
                   '("melpa" . "https://melpa.org/packages/"))

      ;; Function to install packages if not already installed
      (defun install-packages ()
        "Install required packages."
        (unless (package-installed-p 'evil)
          (package-refresh-contents)
          (package-install 'evil))
        ;; Enable Evil
        (require 'evil)
        (evil-mode 1))

      ;; Delay package installation until after initialization
      (add-hook 'after-init-hook 'install-packages)

      (custom-set-variables
       ;; custom-set-variables was added by Custom.
       ;; If you edit it by hand, you could mess it up, so be careful.
       ;; Your init file should contain only one such instance.
       ;; If there is more than one, they won't work right.
       '(package-selected-packages '(evil)))
      (custom-set-faces
       ;; custom-set-faces was added by Custom.
       ;; If you edit it by hand, you could mess it up, so be careful.
       ;; Your init file should contain only one such instance.
       ;; If there is more than one, they won't work right.
       )
    '';
  };

  home.file = {
    "~/.emacs.d/themes/tokyo-theme.el".source = ./themes/tokyo-theme.el;
  };
}
