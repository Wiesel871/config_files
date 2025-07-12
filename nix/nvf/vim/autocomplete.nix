{...}: {
  #['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  #['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  #['<C-y>'] = cmp.mapping.confirm({ select = true }),
  #["<C-Space>"] = cmp.mapping.complete(), -- default
  nvim-cmp = {
    enable = true;
    mappings = {
      confirm = "<C-y>";
      next = "<C-n>";
      previous = "<C-p>";
    };
  };
}
