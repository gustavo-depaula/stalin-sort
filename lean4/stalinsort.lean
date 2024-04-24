

def stalinSort [LE α] [DecidableRel ((·<=·) : α → α → Prop)] : List α → List α
| []          => []
| [x]         => [x]
| (x::y::zs)  =>
  if x <= y then x :: stalinSort (y :: zs)
  else stalinSort (x :: zs)
