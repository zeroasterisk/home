# Neovim Configuration

This is a personalized Neovim setup designed for efficiency and a clean aesthetic. It uses `vim-plug` for plugin management and is split into a modular structure for easy maintenance.

## 📦 Installation

1.  **Prerequisite**: Ensure you have [Neovim](https://neovim.io/) installed.

2.  **Clone the Dotfiles**:
    If you haven't already, clone this dotfiles repository.
    ```bash
    # Example:
    git clone https://github.com/your-username/dotfiles.git ~/dotfiles
    ```

3.  **Symlink Configuration**:
    Create a symbolic link from this directory's `vimrc` to your Neovim configuration file (`init.vim`).

    ```bash
    mkdir -p ~/.config/nvim
    ln -s ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
    ```

4.  **Install Plugin Manager (`vim-plug`)**:
    Run the following command in your terminal to automatically install `vim-plug`:
    ```bash
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

5.  **Install Plugins**:
    Open Neovim and run the `:PlugInstall` command to install all the plugins defined in `vim/plugins.vim`.
    ```vim
    :PlugInstall
    ```

## 🚀 Usage & Key Features

This configuration is built around a few core concepts and plugins to make editing faster and more intuitive. The leader key is set to `,`.

### File & Project Navigation

-   **Fuzzy Finding (`fzf.vim`)**: The core of navigation.
    -   `<C-p>`: Search recently opened files (`:History`).
    -   `<C-f>`: Fuzzy find any file in the current git repository (`:GFiles`).
    -   `<C-g>`: Fuzzy find among modified/untracked files in git (`:GFiles?`).
    -   `<C-b>`: Switch between open buffers (`:Buffers`).
    -   `<leader>a`: Search for content in the project using `ag` (`:Ag`).
-   **File Tree (`NERDTree`)**:
    -   `\e`: Toggle the NERDTree file explorer.

### Editing & Workflow

-   **Saving Files**:
    -   `;;`: A quick shortcut to save the current file in both Normal and Insert mode.
-   **Commenting (`NERDCommenter`)**:
    -   Quickly comment and uncomment code. Select lines in visual mode and hit `<leader>c<space>` or use motions like `<leader>cc` for the current line.
-   **Code Linting (`ALE`)**:
    -   Asynchronous linting runs automatically on file save.
    -   Errors and warnings appear in the Lightline status bar.
    -   `<C-j>` / `<C-k>`: Jump to the next/previous linting error.
    -   `\d`: Toggle the ALE detail window.
-   **Git Integration (`vim-fugitive` & `vim-gitgutter`)**:
    -   `\g`: Open a `git status` window (`:Gstatus`). From here you can stage, commit, and diff files.
    -   GitGutter signs (`∙`) appear in the left column to indicate added, modified, or removed lines.
-   **Surrounding Text (`vim-surround`)**:
    -   Easily add, change, and delete surrounding characters like quotes, brackets, and tags.
    -   `ysiw"`: Surround the word under the cursor with double quotes.
    -   `cs"'`: Change surrounding double quotes to single quotes.
    -   `<leader>.'`: A shortcut to wrap the current word in single quotes.
-   **Distraction-Free Writing (`Goyo`)**:
    -   `\f`: Toggle Goyo mode for a centered, minimalist writing environment.

### Window & Tab Management

-   **Window Splitting**:
    -   `<leader>H`: Create a new horizontal split.
    -   `<leader>V`: Create a new vertical split.
-   **Window Navigation**:
    -   `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: Move between window splits.
-   **Tab Navigation**:
    -   `<C-t>`: Open a new tab.
    -   `<C-LEFT>` / `<C-RIGHT>`: Switch between tabs.

### Testing (`vim-test`)

-   Quickly run tests from within Vim.
    -   `<leader>t`: Run the test nearest to the cursor.
    -   `<leader>T`: Run all tests in the current file.
    -   `<leader>a`: Run the entire test suite.

### Configuration Management

-   `<leader>ev`: Quickly open your `vimrc` (`init.vim`) for editing.
-   `<leader>rv`: Reload the configuration after making changes.
-   `./vim/update.sh`: Run this script from your dotfiles directory to update all plugins.
