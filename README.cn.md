# vim-termtask

- 一个简单的基于Vimscript的项目管理和构建工具

## 作者

- **chenxuan**

## 效果

[bilibili](https://www.bilibili.com/video/BV1s14y1V7Na/)

## 依赖

- 如果需要使用quickfix异步输出,依赖[asyncrun](https://github.com/skywind3000/asyncrun.vim)

- 如果只使用默认终端不需要

## 安装

#### plug

```vim
plug 'skywind3000/asyncrun.vim' (可选)

plug 'chenxuan520/termtask.vim'
```

## 使用

#### config文件编辑

- 使用:TaskConfig快速打开项目配置文件(没有自动新建)

  
  > 注意: 配置文件moren为.config.vim,默认在项目根目录(有.git文件夹目录)
  > 
  > 如果向上不存在.git文件夹,会直接echo 错误

#### 任务执行

- 使用:TaskRun <task-name> 快速运行 task-name 任务

#### config文件说明

```vim
let g:Term_project_task=[
            \{
            \'name'       : 'build',
            \'command'    : 'ls -alh',
            \'path'       : termtask#Term_get_dir(),
            \'close'      : 0,
            \'type'       : 'vsplit',
            \'key'        : '\1',
            \'quickfix'   : 1,
            \'pre_script' : '',
            \'end_script' : '',
            \},
            \]
```

- name为任务名称

- command 为任务指令,shell可以只用&&隔开

- path为运行的路径

  
  > termtask#Term_get_dir() 为项目根目录
  > 
  > expand("%:p:h") 为当前buffer目录
  > 
  > 目录可以使用 . 连接
  > 
  > 如termtask#Term_get_dir() . "/src"

- close 为运行结束是否自动关闭,默认为0(不关闭)

- key 为绑定的快捷键map

- quickfix 为是否使用quickfix作为输出,默认为0,为1需要[asyncrun](https://github.com/skywind3000/asyncrun.vim)

- pre_script/end_script 为在任务执行前和任务执行后需要执行的vimscript脚本

## 选项

#### g:termtask_auto_load

- 设置为1则每次打开VIM自动搜索并加载项目的.config.vim文件(默认为0),否则该文件只有在运行:TaskRun 后才会加载

## 特点

1. 简单小巧,内部代码100余行,实现任务系统的构建,几乎不影响VIM启动速度

2. .config.vim作为每个项目运行加载文件,可以实现不同项目的不同VIM属性

3. 实现每个任务执行前和执行后可以运行不同的代码,更加方便扩展

4. 文件使用Vimscript,可以使用内置的函数扩展

5. 支持通过quickfix异步构建和terminial实时输出,更加方便

6. 支持快捷键的绑定

---

如果你喜欢这个仓库,可以给个⭐
