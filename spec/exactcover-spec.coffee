ExactCover = require "../exactcover"

describe "ExactCover", ->
  beforeEach ->
    @ec = new ExactCover [0..4], { a: [0,4], b: [0,3], c: [1], d:[2,3], e: [2] }

  describe "#solve", ->
    it 'solves given problem correctly', ->
      (expect @ec.solve().sort()).toEqual [ 'a', 'c', 'd' ]
