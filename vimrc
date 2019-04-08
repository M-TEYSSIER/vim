" Maxime TEYSSIER
" Etudiant Licence Professionnel RT IoT
"
" TP  VIM
"
"
" Ce vimrc est pour l'instant largement bon pour mes attentes. Je ne maitrise
" pas encore tout l'environmment de mes plugins. 
" Beaucoup son graphique ( lightline, vim-gitbranch,YCM) ainsi je me repère
" plus facilement dans mes fichiers lancés.
" Vundle me permet de ne pas avoir à placer tout les repo git des autres
" plugin, il les recherchent et les installent seul, via la commande
" :PluginInstall
" vim-fugitive me donne accès aux fonctionnalités de git rapidement. Même si
" je privilegie un programme pour une fonction. (Vim=Editeur != Git.) Mais la
" rapidité est utile.
"



set nocompatible             " Enlève la compatibilité avec l'ancienne version
filetype off                 " Evite la détéction de filetype


" ---- Installation de plugin

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()                             " Tout ce qui ce trouve entre le begin et le end avec le nom du repo git permet d'installer via vundle, le plugin

Plugin 'VundleVim/Vundle.vim'                   " Pluging Installateur de plugin
Plugin 'itchyny/lightline.vim'                  " Plugin pour la barre d'information 
Plugin 'itchyny/vim-gitbranch'                  " Plugin pour ajouter des fonctionnalité git sur la barre 
Plugin 'scrooloose/nerdtree'                    " Plugin pour l'arborescence du système
Plugin 'tpope/vim-fugitive'                     " Plugin pour gerer les fonctionnalité git dans VIM
Plugin 'Valloric/YouCompleteMe'                 " Plugin est un moteur de complétion de code

call vundle#end()                                       
filetype plugin indent on    

" ---- Fin de l installation de plugin


" ----CONFIGURATION

set history=1000				" L'historique est augmenté à 1000 commandes executées
set number					" Affiche le numéro de la ligne
set scrolloff=5 				" Permet d'afficher durant un scrolling 5 lignes préc/suiv au curseur
set autoread					" Execute une relecture du fichier s'il a été modifié via l'exterieur
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
set laststatus=2                                " Affiche la barre du bas constament

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



let g:ycm_python_interpreter_path = ''          
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
