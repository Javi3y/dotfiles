-- Enable vim-airline
vim.g.airline_powerline_fonts = 1 -- Use Powerline fonts (install these if you haven't already)
vim.g.airline_theme = 'base16_gruvbox_dark_medium' -- Set the theme


-- Enable tabline and buffer display
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique'

-- Display file encoding and format
--vim.g.airline_section_x = '%{&fileformat} %{&fileencoding}'
vim.g.airline_section_y = ''
vim.g.airline_section_z = '%p%% %l:%c'

-- Enable specific extensions
vim.g['airline#extensions#branch#enabled'] = 0
vim.g['airline#extensions#hunks#enabled'] = 0
vim.g['airline#extensions#ale#enabled'] = 0
vim.g['airline#extensions#nvimlsp#enabled'] = 1

-- Customize the separator styles
vim.g.airline_left_sep = ''
vim.g.airline_right_sep = ''

vim.cmd("AirlineRefresh")
