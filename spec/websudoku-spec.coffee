WebSudoku = require "../websudoku"

describe "WebSudoku", ->
  beforeEach ->
    @ws = new WebSudoku 1, 'Easy'

  describe "#level", ->
    it 'maps "Easy" to 1', ->
      (expect @ws.level()).toEqual 1

  describe "#parse", ->
    beforeEach ->
      @ws.parse 'VALUE="4" ID=f12'
    it "stores given value correctly", ->
      (expect @ws.ws[2][1]).toEqual 4

  describe "#solve", ->
    it 'should solve given Sudoku correctly', ->
      @ws.getSolution (s) -> s
      waitsFor (-> @ws.gotSudoku()), "Sudoku never received", 2000
      runs ->
        (expect @ws.solve()).toEqual """
-------------------------
| 9 1 8 | 7 4 5 | 6 3 2 |
| 5 3 2 | 6 1 9 | 7 8 4 |
| 6 4 7 | 2 8 3 | 9 1 5 |
-------------------------
| 2 8 6 | 5 3 4 | 1 7 9 |
| 3 9 4 | 1 7 8 | 2 5 6 |
| 7 5 1 | 9 2 6 | 8 4 3 |
-------------------------
| 1 6 9 | 4 5 7 | 3 2 8 |
| 8 2 5 | 3 6 1 | 4 9 7 |
| 4 7 3 | 8 9 2 | 5 6 1 |
-------------------------

"""
