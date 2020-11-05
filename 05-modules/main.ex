alias IterInt.Filter
# alias IterInt.Map, as: IMap
# alias IterString.Map, as: SMap

import Filter, only: [is_mod4: 1]

IO.puts(is_mod4(3))
IO.puts(is_mod4(4))

import IterInt.Map
