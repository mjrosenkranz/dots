-- get rid of meta bindings which would interfere with
-- tmux bindings
vim.g.sexp_mappings = {
  sexp_swap_list_backward = '',
  sexp_swap_list_forward =  '',
  sexp_swap_element_backward = '',
  sexp_swap_element_forward = '',
}
