return {
  { 'renerocksai/telekasten.nvim',
    cmd = 'Telekasten',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local home = vim.fn.expand("~/notes")

      require('telekasten').setup({
        home                        = home,
        take_over_my_home           = true,
        auto_set_filetype           = true,
        templates                   = home .. '/templates',
        dailies                     = home .. '/journal/daily',
        weeklies                    = home .. '/journal/weekly',
        image_subdir                = "img",
        extension                   = ".md",
        prefix_title_by_uuid        = false,
        uuid_type                   = "%Y%m%d%H%M",
        uuid_sep                    = "-",
        follow_creates_nonexisting  = true,
        dailies_create_nonexisting  = true,
        weeklies_create_nonexisting = true,
        template_new_note           = home .. '/templates/new-note-template.md',
        template_new_daily          = home .. '/templates/daily-note-template.md',
        template_new_weekly         = home .. '/templates/weekly-note-template.md',
        image_link_style            = "markdown",
        sort                        = "filename",
        plug_into_calendar          = false,
        calendar_opts               = {
          weeknm          = 4,
          calendar_monday = 1,
          calendar_mark   = 'left-fit',
        },
        close_after_yanking         = false,
        insert_after_inserting      = true,
        tag_notation                = "#tag",
        command_palette_theme       = "ivy",
        show_tags_theme             = "ivy",
        subdirs_in_links            = true,
        template_handling           = "smart",
        new_note_location           = "smart",
        rename_update_links         = true,
      })

      vim.cmd [[
        hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
        hi tkBrackets ctermfg=gray guifg=gray
        hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
        hi link CalNavi CalRuler
        hi tkTagSep ctermfg=gray guifg=gray
        hi tkTag ctermfg=175 guifg=#d3869B
      ]]
    end },
}
