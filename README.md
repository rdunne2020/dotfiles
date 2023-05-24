Neovim config shamelessly stolen from this [repo](https://github.com/Allaman/nvim/)

Please look there for an actual good implementation of neovim

## Neovim Keybindings
### Leader = " "

### Oil
| Key | Action |
| --- | ------ |
| <ld> oo | Open Oil on CWD |
| g? | Show Help |
| <CR> | Select |
| C-v | Select and vsplit |
| C-h | Select and split |
| C-t | Select and new tab |
| C-p | Preview |
| C-l | Refresh |
| q | Close |
| - | Open Parent |
| _ | Open CWD |
| C-c | cd |
| ~ | Open Terminal |
| . | Toggle Hidden |

*Note: * Opening terminal in Oil is currently broken

### ToggleTerm
| Key | Action |
| --- | ------ |
| C-t | Open Terminal |
| C-h,j,k,l | Move to other panes |

*Note: * Outside of opening up the terminal, all other keybinds happen when in insert mode in the terminal

### Telescope
| Key | Action |
| --- | ------ |
| <ld> sc | Telescope Commands |
| <ld> st | Telescope live_grep |
| <ld> s? | Telescope help_tags |
| <ld> sh | Telescope heading |
| <ld> sk | Telescope keymaps |
| <ld> s0 | Telescope vim_options |
| <ld> sp | Telescope projects |
| <ld> sR | Telescope Registers |
| <ld> ss | Telescope grep_string under cursor |
| <ld> sS | Telescope Symbols |
| <ld> sf | Telescope grep_string |
| <ld> s: | Telescope Search History |
| <ld> s; | Telescope command_history |
| <ld> gh | Telescope git_branches |
| <ld> gs | Telescope git_status |
| <ld> gm | Telescope git_commits |
| <ld> fb | Telescope file_browser |
| <ld> mt | Telescope |

### LSP
| Key | Action |
| --- | ------ |
| <ld>lD | GoTo Declaration |
| <ld>ll | Line Diagnostics |
| <ld>lR | IncRename |
| <ld>li | Lsp Info |
| <ld>ld | GoTo Definition |
| <ld>lr | Show References |
| <ld>lI | GoTo Implementation |
| <ld>lt | GoTo Type Definition |
| <ld>lk | Hover |
| <ld>lS | Signature Help |
| C-k    | Signature Help in Insert Mode |
| <ld>ln | Next Diagnostic |
| <ld>la | Code Action |
| <ld>ls | Document Symbols |
| <ld>le | Document Diagnostics |
| <ld>lwa | Add Folder |
| <ld>lwl | List Folders |
| <ld>lwr | Remove Folders |

### Neotree
| Key | Action |
| --- | ------ |
| <ld> fp | Run Neotree |

| Filesystem Keybinds | Action |
| ------------------- | ------ |
| CR | Open File |
| P | Toggle Preview |
| l | Focus Preview |
| S | Open With Split |
| s | Open with VSplit |
| t | Open with tabnew |
| w | Open with window picker |
| C | Close Node |
| z | Close all nodes |
| R | Refresh |
| a | Add File |
| A | Add Directory |
| y | Copy to Clipboard |
| x | Cut to Clipboard |
| p | Paste from clipboard |
| c | Copy |
| m | Move |
| e | Toggle auto expand width |
| H | Toggle Hidden |
| / | Fuzzyfinder |
| D | Fuzzyfinder Directory |
| # | FuzzySorter |
| q | Close Window |
| ? | Show Help |
| > | Next Src |
| < | Prev Src |

| Git Keybinds | Action |
| ------------------- | ------ |
| A | Git Add All |
| gu | Git Unstage File |
| ga | Git Add File |
| gr | Git Revert File |
| gc | Git Commit |
| gp | Git Push |
| gg | Git Commit & Push |
