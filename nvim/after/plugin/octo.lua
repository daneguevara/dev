require("octo").setup({
  suppress_missing_scope = {
    projects_v2 = true,
  },
  use_local_fs = false,                    -- use local files on right side of reviews
  enable_builtin = false,                  -- shows a list of builtin actions when no action is provided
  default_remote = {"upstream", "origin"}; -- order to try remotes
  default_merge_method = "commit",         -- default merge method which should be used when calling `Octo pr merge`, could be `commit`, `rebase` or `squash`
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  picker = "telescope",                    -- or "fzf-lua"
  picker_config = {
    use_emojis = false,                    -- only used by "fzf-lua" picker for now
    mappings = {                           -- mappings for the pickers
      open_in_browser = { lhs = "<c-x>", desc = "open issue in browser" },
      copy_url = { lhs = "<c-y>", desc = "copy url to system clipboard" },
      checkout_pr = { lhs = "<c-o>", desc = "checkout pull request" },
      -- merge_pr = { lhs = "<c-r>", desc = "merge pull request" },
    },
  },
  comment_icon = "▎",                      -- comment marker
  outdated_icon = "󰅒 ",                    -- outdated indicator
  resolved_icon = " ",                    -- resolved indicator
  reaction_viewer_hint_icon = " ";        -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = " ";                  -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- bubble delimiter
  left_bubble_delimiter = "";             -- bubble delimiter
  github_hostname = "";                    -- github enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  gh_cmd = "gh",                           -- command to use when calling github cli
  gh_env = {},                             -- extra environment variables to pass on to github cli, can be a table or function returning a table
  timeout = 5000,                          -- timeout for requests between the remote server
  default_to_projects_v2 = false,          -- use projects v2 for the `octo card ...` command by default. both legacy and v2 commands are available under `octo cardlegacy ...` and `octo cardv2 ...` respectively.
  ui = {
    use_signcolumn = false,                -- show "modified" marks on the sign column
    use_signstatus = true,                 -- show "modified" marks on the status column
  },
  issues = {
    order_by = {                           -- criteria to sort results of `octo issue list`
      field = "created_at",                -- either comments, created_at or updated_at (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "desc"                   -- either desc or asc (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {                           -- criteria to sort the results of `octo pr list`
      field = "comments",
      direction = "desc"                   -- either desc or asc (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = false -- always give prompt to select base remote repo when creating prs
  },
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  colors = {                               -- used for highlight groups (see colors section below)
    white = "#ffffff",
    grey = "#2a354c",
    black = "#000000",
    red = "#fdb8c0",
    dark_red = "#da3633",
    green = "#acf2bd",
    dark_green = "#238636",
    yellow = "#d3c846",
    dark_yellow = "#735c0f",
    blue = "#58a6ff",
    dark_blue = "#0366d6",
    purple = "#6f42c1",
  },
  mappings_disable_default = true,        -- disable default mappings if true, but will still adapt user mappings
  mappings = {
    issue = {
      -- close_issue = { lhs = "<leader>ic", desc = "close issue" },
      -- reopen_issue = { lhs = "<leader>io", desc = "reopen issue" },
      list_issues = { lhs = "<leader>il", desc = "list open issues on same repo" },
      reload = { lhs = "<c-r>", desc = "reload issue" },
      open_in_browser = { lhs = "<leader>x", desc = "open issue in browser" },
      copy_url = { lhs = "<c-y>", desc = "copy url to system clipboard" },
      -- add_assignee = { lhs = "<leader>aa", desc = "add assignee" },
      -- remove_assignee = { lhs = "<leader>ad", desc = "remove assignee" },
      -- create_label = { lhs = "<leader>lc", desc = "create label" },
      add_label = { lhs = "<leader>la", desc = "add label" },
      remove_label = { lhs = "<leader>ld", desc = "remove label" },
      -- goto_issue = { lhs = "<leader>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<c-a>", desc = "add comment" },
      delete_comment = { lhs = "dd", desc = "delete comment" },
      next_comment = { lhs = "]n", desc = "go to next comment" },
      prev_comment = { lhs = "[n", desc = "go to previous comment" },
      react_hooray = { lhs = "<leader>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<leader>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<leader>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<leader>ru", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<leader>rd", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<leader>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<leader>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<leader>rc", desc = "add/remove 😕 reaction" },
    },
    pull_request = {
      checkout_pr = { lhs = "<leader>po", desc = "checkout PR" },
      merge_pr = { lhs = "<leader>pm", desc = "merge commit PR" },
      -- squash_and_merge_pr = { lhs = "<leader>psm", desc = "squash and merge PR" },
      -- rebase_and_merge_pr = { lhs = "<leader>prm", desc = "rebase and merge PR" },
      list_commits = { lhs = "<leader>pc", desc = "list PR commits" },
      list_changed_files = { lhs = "<leader>pf", desc = "list PR changed files" },
      show_pr_diff = { lhs = "<leader>pd", desc = "show PR diff" },
      add_reviewer = { lhs = "<leader>va", desc = "add reviewer" },
      remove_reviewer = { lhs = "<leader>vd", desc = "remove reviewer request" },
      -- close_issue = { lhs = "<leader>ic", desc = "close PR" },
      -- reopen_issue = { lhs = "<leader>io", desc = "reopen PR" },
      list_issues = { lhs = "<leader>il", desc = "list open issues on same repo" },
      reload = { lhs = "<c-r>", desc = "reload pr" },
      open_in_browser = { lhs = "<leader>px", desc = "open PR in browser" },
      copy_url = { lhs = "<c-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
      -- add_assignee = { lhs = "<leader>aa", desc = "add assignee" },
      -- remove_assignee = { lhs = "<leader>ad", desc = "remove assignee" },
      -- create_label = { lhs = "<leader>lc", desc = "create label" },
      -- add_label = { lhs = "<leader>la", desc = "add label" },
      -- remove_label = { lhs = "<leader>ld", desc = "remove label" },
      -- goto_issue = { lhs = "<leader>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<c-a>", desc = "add comment" },
      delete_comment = { lhs = "dd", desc = "delete comment" },
      next_comment = { lhs = "cn", desc = "go to next comment" },
      prev_comment = { lhs = "cp", desc = "go to previous comment" },
      react_hooray = { lhs = "<leader>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<leader>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<leader>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<leader>ru", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<leader>rd", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<leader>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<leader>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<leader>rc", desc = "add/remove 😕 reaction" },
      review_start = { lhs = "<leader>vs", desc = "start a review for the current PR" },
      review_resume = { lhs = "<leader>vr", desc = "resume a pending review for the current PR" },
    },
    review_thread = {
      -- goto_issue = { lhs = "<leader>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<c-a>", desc = "add comment" },
      add_suggestion = { lhs = "<c-s>", desc = "add suggestion" },
      delete_comment = { lhs = "dd", desc = "delete comment" },
      next_comment = { lhs = "cn", desc = "go to next comment" },
      prev_comment = { lhs = "cp", desc = "go to previous comment" },
      select_next_entry = { lhs = "qn", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "qp", desc = "move to next changed file" },
      select_first_entry = { lhs = "qf", desc = "move to first changed file" },
      select_last_entry = { lhs = "ql", desc = "move to last changed file" },
      close_review_tab = { lhs = "qq", desc = "close review tab" },
      react_hooray = { lhs = "<leader>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<leader>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<leader>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<leader>ru", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<leader>rd", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<leader>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<leader>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<leader>rc", desc = "add/remove 😕 reaction" },
    },
    submit_win = {
      approve_review = { lhs = "<c-a>", desc = "approve review" },
      comment_review = { lhs = "<c-m>", desc = "comment review" },
      request_changes = { lhs = "<c-r>", desc = "request changes review" },
      close_review_tab = { lhs = "qq", desc = "close review tab" },
    },
    review_diff = {
      submit_review = { lhs = "<leader>vs", desc = "submit review" },
      discard_review = { lhs = "<leader>vd", desc = "discard review" },
      add_review_comment = { lhs = "<c-a>", desc = "add a new review comment" },
      add_review_suggestion = { lhs = "<c-s>", desc = "add a new review suggestion" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      next_thread = { lhs = "]t", desc = "move to next thread" },
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
      select_next_entry = { lhs = "qn", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "qp", desc = "move to next changed file" },
      select_first_entry = { lhs = "qf", desc = "move to first changed file" },
      select_last_entry = { lhs = "ql", desc = "move to last changed file" },
      close_review_tab = { lhs = "qq", desc = "close review tab" },
      -- toggle_viewed = { lhs = "<leader><leader>", desc = "toggle viewer viewed state" },
      goto_file = { lhs = "gf", desc = "go to file" },
    },
    file_panel = {
      submit_review = { lhs = "<leader>vs", desc = "submit review" },
      discard_review = { lhs = "<leader>vd", desc = "discard review" },
      next_entry = { lhs = "<c-n>", desc = "move to next changed file" },
      prev_entry = { lhs = "<c-p>", desc = "move to previous changed file" },
      select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
      refresh_files = { lhs = "R", desc = "refresh changed files panel" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      select_next_entry = { lhs = "qn", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "qp", desc = "move to next changed file" },
      select_first_entry = { lhs = "qf", desc = "move to first changed file" },
      select_last_entry = { lhs = "ql", desc = "move to last changed file" },
      close_review_tab = { lhs = "qq", desc = "close review tab" },
      -- toggle_viewed = { lhs = "<leader><leader>", desc = "toggle viewer viewed state" },
    },
  },
})

-- last pr
vim.api.nvim_set_keymap("n", "<leader>pp", "<cmd>Octo pr<cr>", { noremap = true, silent = true })
-- pr search
vim.api.nvim_set_keymap("n", "<leader>ps", ":Octo pr search is:open ", { noremap = true })
-- team pr
vim.api.nvim_set_keymap("n", "<leader>pr", "<cmd>Octo pr search is:open label:unicorn<cr>", { noremap = true, silent = true })
