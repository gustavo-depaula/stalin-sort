type StalinSort<Arr extends number[], Last extends number = Arr[0]> =
    // stupid type guards
    Arr extends [infer Elem, ...infer Rest] ? Elem extends number ? Rest extends number[]
        ? GreaterOrEqual<Elem, Last> extends true
            ? [Elem, ...StalinSort<Rest, Elem>]
            : StalinSort<Rest, Last>
    : never : never : Arr;

type GreaterOrEqual<A extends number, B extends number> =
    NumToArr<A> extends [...NumToArr<B>, ...infer Rem]
    ? true : false;

type NumToArr<N extends number, Acc extends any[] = []> = Acc["length"] extends N
    ? Acc
    : NumToArr<N, [...Acc, any]>;
