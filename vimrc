" Maxime TEYSSIER
" Étudiant Licence Professionnel RT IoT
"
" TP  VIM
"
"
" Ce vimrc est pour l'instant largement bon pour mes attentes. Je ne maitrise
" pas encore tout l'environnement de mes plugins.
" Beaucoup son graphique ( lightline, vim-gitbranch,YCM) ainsi je me repère
" plus facilement dans mes fichiers lancés.
" Vundle me permet de ne pas avoir à placer tout les repo git des autres
" plugin, il les recherchent et les installent seul, via la commande
" :PluginInstall
" vim-fugitive me donne accès aux fonctionnalités de git rapidement. Même si
" je privilégie un programme pour une fonction. (Vim=Éditeur != Git.) Mais la
" rapidité est utile.
"



set nocompatible             " Enlève la compatibilité avec l'ancienne version
filetype off                 " Évite la détection de filetype
syntax on


" ---- Installation de plugin

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()                             " Tout ce qui ce trouve entre le begin et le end avec le nom du repo git permet d'installer via vundle, le plugin

Plugin 'VundleVim/Vundle.vim'                   " Pluging Installateur de plugin
Plugin 'itchyny/lightline.vim'                  " Plugin pour la barre d'information 
Plugin 'itchyny/vim-gitbranch'                  " Plugin pour ajouter des fonctionnalité git sur la barre 
Plugin 'scrooloose/nerdtree'                    " Plugin pour l'arborescence du système
Plugin 'tpope/vim-fugitive'                     " Plugin pour gérer les fonctionnalité git dans VIM
Plugin 'mcmartelle/vim-monokai-bold'            " Thème
Plugin 'vim-scripts/indentpython.vim'           " Auto indentation 
Plugin 'thaerkh/vim-workspace'                  " Latex; Auto sauvegarde
Plugin 'thaerkh/vim-indentguides'               " Vim; Affichage de tiret pour connaître le niveau d'indentation
Plugin 'dpelle/vim-Grammalecte'                 " Correcteur grammatical
Plugin 'xuhdev/vim-latex-live-preview'          " Previewer LaTeX




call vundle#end()                                       
filetype plugin indent on    

" ---- Fin de l installation de plugin


" ----CONFIGURATION

colorscheme monokai-bold
set history=1000				" L'historique est augmenté à 1000 commandes exécutées
set number					" Affiche le numéro de la ligne
set scrolloff=5 				" Permet d'afficher durant un scrolling 5 lignes préc/suiv au curseur
set autoread					" Execute une relecture du fichier s'il a été modifié via l'extérieur
set wildmenu				        " Active le menu de complétion 
set wildmode=longest:full,full
set mouse=a					" Utilisation de la souris
set showcmd 				        " Affiche les commandes en cours de frappe
set expandtab					" Les Tabulations sont convertis en espaces
set nowritebackup				" L'enregistrement du fichier ce fait directement dans le dossier sans passer par un fichier de configuration
set directory=$HOME/.vim/swap_files//		" Les fichiers de swaps sont placés dans un dossier(swap_files/) dans le .vim du répertoire personnel
set backupdir=$HOME/.vim/backup_files// 	" Les fichiers de backup sont placés dans un dossier(backup_files/) dans le .vim du répertoire personnel
set hidden					" Permet de changer de fichier et au retour l'historique de undo est toujours dispo...
" set background=industry COULEUR INDUSTRY

set cursorline					" cursorline permet de personnaliser le cursor dans l'éditeur (le curseur prend toute la ligne)
hi CursorLine cterm=NONE ctermbg=blue ctermfg=black guibg=darkgrey guifg=black	" Modifie le bg/fg/... du corsorline
autocmd InsertEnter * set nocursorline		" Lors de l'entrée dans le mode INSERT, la cursorline disparait
autocmd InsertLeave * set cursorline		" Lors du départ du mode INSERT, la cursorline réapparait


" MAPPING 
nnoremap <C-RIGHT> :bnext<CR>			" Re-map la commande :bnext avec le combo CTRL+flecheDroite
nnoremap <C-LEFT>  :bprev<CR>			" Re-map la commande :bprev avec le combo CTRL+flecheGauche

" ---- 
set laststatus=2                                " Affiche la barre du bas constamment

" En dessous, voici la personnalisation de la barre. 'left' représente les
" modules affichés sur la gauche de la barre. Et 'right' les modules à droite
" de la barre.
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ], 
      \  'right': [ [ 'lineinfo', 'charvaluehex' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ] 
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


" LATEX
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'
let g:workspace_autosave_always = 1 "let g:workspace_autosave = 0 <- Désactiver

" Indentation style
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

" Correcteur orthographique (non grammatical)
setlocal spell
setlocal spelllang=fr,en
setlocal spellfile=$HOME/.vim/spell/fr.utf-8.add,$HOME/.vim/spell/en.utf-8.add
" Adouci les couleurs du correcteur
 hi clear SpellBad
 hi clear SpellCap
 hi clear SpellRare
 hi clear SpellLocal
 hi SpellBad   cterm=underline ctermfg=9  ctermbg=0 gui=undercurl
 hi SpellCap   cterm=underline ctermfg=14 ctermbg=0 gui=undercurl
 hi SpellRare  cterm=underline ctermfg=13 ctermbg=0 gui=undercurl
 hi SpellLocal cterm=underline ctermfg=11 ctermbg=0 gui=undercurl

" mapleader est la touche/combinaison qui permet d'appeler le correcteur
let mapleader=' '
nnoremap <Leader>ts :setlocal spell! spell?<Return>

" Correcteur grammatical
let g:grammalecte_cli_py='/home/mteyssier/.vim/plugin/grammalecte-cli.py'

" Previewer 4 LaTeX
let g:livepreview_previewer = 'evince'
