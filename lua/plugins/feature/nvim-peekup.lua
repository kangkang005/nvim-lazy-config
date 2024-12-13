-- dynamically interact with vim registers
--
-- Default          commands
--  key             description
--  ""              open peekup window
--  <Esc>           close peekup window
--  any character   select and copy text from the corresponding " register
-- <C-j>, <C-k>     scroll the list up and down
-- <Up>, <Down>     move to next registers type
-- "x               empty all registers (outside the peekup window)
return {
  "gennaro-tedesco/nvim-peekup",
}
