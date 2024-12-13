-- Neovide Setting
-- Web: https://neovide.dev/configuration.html
if vim.g.neovide then
  -- font
  -- vim.o.guifont = "Source Code Pro:h14"
  -- line space
  vim.opt.linespace = 0 -- spacing between lines
  -- scale
  vim.g.neovide_scale_factor = 1.0

  -- Contrast
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5

  -- Padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Floating Blur Amount
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- Floating Shadow
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  -- Floating Corner Radius
  vim.g.neovide_floating_corner_radius = 0.0

  -- Transparency: 0.0 transparent, 1.0 opaque
  vim.g.neovide_transparency = 1

  -- Position Animation Length: time
  vim.g.neovide_position_animation_length = 0.15

  -- Scroll Animation Length: time
  vim.g.neovide_scroll_animation_length = 0.3

  -- Far scroll lines
  vim.g.neovide_scroll_animation_far_lines = 1

  -- Animation Trail Size
  vim.g.neovide_scroll_animation_trail_size = 0.8

  -- Antialiasing
  vim.g.neovide_cursor_antialiasing = true

  -- Animate in insert mode
  vim.g.neovide_cursor_animate_in_insert_mode = true

  -- Animate switch to command line
  vim.g.neovide_cursor_animate_command_line = true

  -- Unfocused Outline Width
  vim.g.neovide_cursor_unfocused_outline_width = 0.125

  -- Animate cursor blink
  vim.g.neovide_cursor_smooth_blink = false

  -- Hiding the mouse when typing
  vim.g.neovide_hide_mouse_when_typing = false

  -- Underline automatic scaling
  vim.g.neovide_underline_stroke_scale = 10.0

  -- Theme
  vim.g.neovide_theme = "auto"

  -- Layer grouping
  vim.g.experimental_layer_grouping = false

  -- Refresh Rate
  vim.g.neovide_refresh_rate = 60

  -- Idle Refresh Rate
  vim.g.neovide_refresh_rate_idle = 5

  -- No Idle
  vim.g.neovide_no_idle = true

  -- Confirm Quit
  vim.g.neovide_confirm_quit = true

  -- Detach On Quit
  vim.g.neovide_detach_on_quit = "always_quit"

  -- Fullscreen
  vim.g.neovide_fullscreen = false

  -- Remember Previous Window Size
  vim.g.neovide_remember_window_size = true

  -- Profiler: shows a frametime graph in the upper left corner
  vim.g.neovide_profiler = false

  -- Touch Deadzone
  vim.g.neovide_touch_deadzone = 6.0

  -- Touch Drag Timeout
  vim.g.neovide_touch_drag_timeout = 0.17

  -- Cursor Particles
  -- Style: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe, or "", default to ""
  vim.g.neovide_cursor_vfx_mode = "railgun"

  -- Particle Opacity
  vim.g.neovide_cursor_vfx_opacity = 200.0

  -- Particle Lifetime
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

  -- Particle Density
  vim.g.neovide_cursor_vfx_particle_density = 7.0

  -- Particle Speed
  vim.g.neovide_cursor_vfx_particle_speed = 10.0

  -- Particle Phase
  vim.g.neovide_cursor_vfx_particle_phase = 1.5

  -- Particle Curl, Only for the railgun vfx mode.
  vim.g.neovide_cursor_vfx_particle_curl = 1.0
end
