{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.vscodevim.vim
      vscode-extensions.jdinhlife.gruvbox
      vscode-extensions.bbenoist.nix
      vscode-extensions.ms-vscode.cpptools
    ];
  };
}
