require('lint').linters_by_ft = {
  markdown = {'vale',},
  cpp = {'clangtidy', 'cppcheck'},
  python = {'pylint', 'mypy'}
}
