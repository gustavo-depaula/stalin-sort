theory Stalin
  imports Main
begin

fun stalin_sort :: "nat list \<Rightarrow> nat list" where
  "stalin_sort [] = []"
| "stalin_sort (a # []) = a # []"
| "stalin_sort (a # b # as) = (if a \<le> b then a # stalin_sort (b # as) else stalin_sort (a # as))"

lemma [simp]: "a \<le> b \<Longrightarrow> x \<in> set (stalin_sort (b # as)) \<Longrightarrow> a \<le> x"
  by (induction "b # as" arbitrary: b as rule: stalin_sort.induct) (auto split: if_splits)

theorem stalin_sorted [simp]: "sorted (stalin_sort as)"
  by (induction as rule: stalin_sort.induct) simp_all

theorem stalin_is_sort [simp]: "set (stalin_sort as) = set as"
  oops

end