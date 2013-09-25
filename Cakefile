WebSudoku = require './websudoku'
{spawn, exec} = require "child_process"

option '-l', '--level [LEVEL]', 'Web Sudoku Level - Easy, Medium, Hard or Evil'
option '-i', '--id [ID]', 'Web Sudoku ID'

task 'websudoku', 'Solve a Sudoku from http://websudoku.com.', (opt) ->
  (new WebSudoku opt.id, opt.level).getSolution (s) -> console.log s

task "jasmine", "Run the Jasmine specs.", ->
  jn = if /^win/.test process.platform
    spawn "cmd", ["/c", "jasmine-node", "--verbose", "--coffee", "spec"]
  else
    spawn "jasmine-node", ["--verbose", "--coffee", "spec"] 
  jn.stdout.on "data", (d) -> process.stdout.write d
  jn.stderr.on "data", (d) -> process.stderr.write d
  jn.on "close", (c) -> console.log "Jasmine finished with exit code: #{c}"
