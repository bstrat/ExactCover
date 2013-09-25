# Port of Algorithm X to CoffeeScript inspired by 
# http://www.cs.mcgill.ca/~aassaf9/python/algorithm_x.html
# Stefan Baumann
# 22 September 2013

class ExactCover
  constructor: (xs, @Y, @X = {}, @S = []) ->
    @X[x] = {} for x in xs
    @X[x][y] = on for x in xs for y, xs of @Y
  select: (s, cs=[]) ->
    for y in @Y[s]
      Object.keys(@X[y]).map (x) => delete @X[z][x] for z in @Y[x].skip y
      cs.push(@X[y]) and delete @X[y]
    cs
  deselect: (s, cs) ->
    for y in @Y[s].slice(0).reverse()
      @X[y] = cs.pop()
      Object.keys(@X[y]).map (x) => @X[z][x] = on for z in @Y[x].skip y
  solve: ->
    [m, _] = [null, Infinity]
    for x, o of @X
      l = Object.keys(o).length
      [m, _] = [x, l] if l < _
    return @S unless m?
    for x, _ of @X[m]
      @S.push(x) and xs = @select x
      return s if (s = @solve())?
      @S.pop() and @deselect x, xs
    undefined
Array::skip = (u) -> (v for v in @ when v.toString() isnt u.toString())

module?.exports = ExactCover
