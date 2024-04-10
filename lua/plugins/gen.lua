vim.keymap.set({'n','v','o'}, '<localleader>g', '<cmd>Gen<cr>', { desc = 'Generate' })
return {
  'David-Kunz/gen.nvim',
  config = function()
    require('gen').model = 'openchat'
    -- require('gen').model = 'zephyr'
    require('gen').prompts['Elaborate_Text'] = {
      prompt = "Elaborate the following text:\n$text",
      replace = true
    }
    require('gen').prompts['Fix_Code'] = {
      prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }
  end,
  enabled = true,
  lazy = true,
  cmd = 'Gen',
}
