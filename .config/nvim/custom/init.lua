vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4

-- Function to execute the compilation command
function CompileCpp()
  vim.cmd(':w')
  vim.cmd(':!g++ % -o %:r.exe -Wl,--stack=268435456 -Wall -Wextra -pedantic -std=c++20 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fno-sanitize-recover -fstack-protector')
end

-- Set up autocmd for cpp files
vim.api.nvim_exec([[
  augroup cpp_autocmds
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <F9> :lua CompileCpp()<CR>
  augroup END
]], false)
