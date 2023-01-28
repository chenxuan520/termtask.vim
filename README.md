# vim-termtask

- A simple project management and build tool based on Vimscript

## Author

- **chenxuan**

- [中文readme](./README.cn.md)

## Effect

[bilibili](https://www.bilibili.com/video/BV1s14y1V7Na/)

## Dependencies

- If you need to use quickfix asynchronous output, depend on [asyncrun](https://github.com/skywind3000/asyncrun.vim)

- Not required if using only the default terminal

## Install

#### plug

```vim
plug 'skywind3000/asyncrun.vim' "(optional)

plug 'chenxuan520/termtask.vim'
```

## Use

#### config file editor

- Use :TaskConfig to quickly open the project configuration file (no new one is created automatically)

  > Note: The config file molen is .config.vim, which by default is in the project root directory (there is a .git folder directory)
  >
  > If the .git folder does not exist upwards, it will echo the error directly

#### Task execution

- Use :TaskRun <task-name> to quickly run the task-name task

#### config file description

```vim
let g:Term_project_task=[
            \{
            \'name' : 'build',
            \'command' : 'ls -alh',
            \'mode' : 'quickfix'
            \'path' : s:root,
            \'close' : 0,
            \'type' : 'vsplit',
            \'key' : '\1',
            \'pre_script' : '',
            \'end_script' : '',
            \},
            \]
```

- name is the name of the task

- command is the task command, shells can be separated by && only

- mode is one of workflow,term,quickfix which is stand for diff mode(default term)

  - quickfix is use quickfix as output, default is 0, 1 requires [asyncrun](https://github.com/skywind3000/asyncrun.vim)

  - term is use inside term command to exec

  - **workflow** is connect for two tasks,such as compile and if success execute the program else show the error

- path is the path to run

  > termtask#Term_get_dir() and s:root is the project root directory
  >
  > expand("%:p:h") for the current buffer directory
  >
  > The directory can be accessed using . link
  >
  > such as termtask#Term_get_dir() . "/src"

- close is whether to close automatically at the end of the run, default is 0 (no close)

- key is the bound shortcut key map


- pre_script/end_script is the vimscript script that needs to be executed before and after the task is executed

## Options

#### g:termtask_auto_load

- Set to 1 to automatically search for and load the project's .config.vim file every time VIM is opened (default is 0), otherwise the file will only be loaded after running :TaskRun

## Features

1. simple and small, 100 lines of internal code to build the task system with little impact on VIM startup speed

2. .config.vim as each project run load file, you can implement different VIM properties of different projects

3. the implementation of each task before and after the execution of different code can be run, more convenient to extend

4. file using Vimscript, you can use the built-in function extension

5. support for asynchronous build and terminial real-time output via quickfix, more convenient

6. support shortcut key binding

---

If you like this repository, you can give a ⭐
