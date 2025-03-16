
-- Neovide only settings
if vim.g.neovide then
    vim.g.neovide_padding_top = 24
    vim.g.neovide_padding_bottom = 2
    vim.g.neovide_padding_right = 14
    vim.g.neovide_padding_left = 14
	vim.g.neovide_remember_window_size = true

	-- Shadow and borders
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
	vim.g.neovide_floating_corner_radius = 0.8
	vim.g.neovide_show_border = false

	-- Cursor
	vim.g.neovide_cursor_vfx_mode = 'railgun'
	vim.g.neovide_cursor_vfx_opacity = 140.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.4
	vim.g.neovide_cursor_vfx_particle_speed = 40.0
	vim.g.neovide_cursor_vfx_particle_phase = 1.5
	vim.g.neovide_cursor_vfx_particle_curl = 1.2

	vim.g.transparency = 0.9
	vim.g.neovide_normal_opacity = 0.82
	vim.g.neovide_background_color = '#420A25' -- '#0f1117'
	vim.g.neovide_window_blurred = true

end

