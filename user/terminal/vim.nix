{ pkgs, lib, ... }:

{
  programs.vim.plugins = [pkgs.vimPlugins.YouCompleteMe];
  programs.vim.enable = true;
  programs.vim.extraConfig = 
''
  filetype plugin indent on
  syntax on
  set title
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set noexpandtab
  set autoindent
  set smartindent

  set termguicolors
  colorscheme elflord
  
  set number
  nnoremap <Leader>cc :set colorcolumn=80<cr>
  nnoremap <Leader>ncc :set colorcolumn-=80<cr>
  set mouse=a
'';
}
