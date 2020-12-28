# POSIX shell scripts for keeping simple daily journaling in markdown

## Installation
- Download the files to any place and symbolic link `diary` to a folder of PATH
- [Optional] Source `complete.bash` in shell profile or `.bashrc` for completion
- Command `realpath` should be available (MacOSX needs additional settings)

## Usage
`diary [COMMAND] [ARGUMENTS]`
-   `COMMAND`:  
    One of { `edit` | `export` | `schedule` | `todo` | `git` }  
    COMMAND = `edit` if omitted

-   `ARGUMENTS`:  
    see `diary COMMAND -h` for individual `COMMAND`

-   Environment variable:
    -   A predefined `DIARY_ROOT` overwrite the current
        directory as the root of markdown folders.
    -   `GIT_EXE` overwrite the path of git executable

- Examples:
    - Omit `COMMAND` (default `COMMAND` = `edit`)
        -   `diary` (which equals to `diary edit today`)
        -   `diary 2 days ago`
        -   `diary yesterday`
        -   `diary today`
        -   `diary tomorrow`
        -   `diary 2 days`
        -   `diary last Monday`
        -   `diary Thursday`
        -   `diary next Tue`
    - View schedule
        -   `diary schedule` (shows schedules in one week)
        -   `diary schedule yesteday`
    - View todo
        -   `diary todo` (shows schedules in one week)
        -   `diary todo tomorrow`
    - Export
        -   `diary export -o diary.html`
    - Git operation (when `DIARY_ROOT` is a different directory)
        -   `diary git commit -a`
