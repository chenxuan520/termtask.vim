
command! -nargs=1 TaskRun :call termtask#Term_task_run(<f-args>)
command! -nargs=0 TaskConfig :call termtask#Term_config_edit()
command! -nargs=0 TaskList :call termtask#Term_task_list()

let g:termtask_auto_load = get(g:, 'termtask_auto_load', 0)
if g:termtask_auto_load
	" auto read project file
	let s:fileway=term#Term_get_dir() . '/.config.vim'
	if filereadable(s:fileway)
		execute 'source ' . s:fileway
	endif
endif

autocmd BufNewFile .config.vim execute ":call VimFastSetPreCode()"
