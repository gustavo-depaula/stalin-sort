HAI 1.3

HOW IZ I stalin_sort YR array AN YR length
  I HAS A index ITZ 0 
  I HAS A sorted_array ITZ A BUKKIT
  I HAS A previous ITZ ""
  I HAS A initialized ITZ FAIL
  I HAS A sorted_array_index ITZ 0

  IM IN YR loop UPPIN YR index TIL BOTH SAEM index AN length
    I HAS A value ITZ array'Z SRS index

    NOT initialized, O RLY?
      YA RLY
        initialized R WIN
        previous R value
        sorted_array HAS A SRS sorted_array_index ITZ previous
        sorted_array_index R SUM OF sorted_array_index AN 1
      NO WAI
        BOTH SAEM value AN BIGGR OF value AN previous, O RLY?
          YA RLY
            previous R value
            sorted_array HAS A SRS sorted_array_index ITZ previous
            sorted_array_index R SUM OF sorted_array_index AN 1
        OIC
    OIC
  IM OUTTA YR loop

  I HAS A result ITZ A BUKKIT
  result HAS A array ITZ sorted_array
  result HAS A length ITZ sorted_array_index
  FOUND YR result
IF U SAY SO

I HAS A array ITZ A BUKKIT
array HAS A SRS 0 ITZ 3.14
array HAS A SRS 1 ITZ 3.15
array HAS A SRS 2 ITZ 2.1
array HAS A SRS 3 ITZ 5.1
array HAS A SRS 4 ITZ 0.1
I HAS A length ITZ 4

I HAS A result ITZ I IZ stalin_sort YR array AN YR length MKAY
VISIBLE result'Z length
I HAS A index ITZ 0
I HAS A sorted ITZ result'Z array
IM IN YR loop UPPIN YR index TIL BOTH SAEM index AN result'Z length
  VISIBLE sorted'Z SRS index
IM OUTTA YR loop

KTHXBYE
