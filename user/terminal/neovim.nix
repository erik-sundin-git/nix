{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
	viAlias = true;
	vimAlias = true;
  };
  programs.neovim.extraConfig = 
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

	programs.neovim.plugins = [
		pkgs.vimPlugins.vim-prettier
		{
			plugin = pkgs.vimPlugins.coc-nvim;
			config = 
			''
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	

			'';
		}
	];
}
