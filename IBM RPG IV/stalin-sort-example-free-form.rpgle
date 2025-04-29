**free
ctl-opt dftactgrp(*no);

dcl-s arr int(10) dim(6);
dcl-s size uns(3) inz(6);
dcl-s i uns(3);

arr = %list(1 : 2 : 5 : 4 : 1 : 6);
stalin_sort(arr : size);

dsply ('New Size : ' + %char(size));
for i = 1 to size;
    dsply arr(i);
endfor;
return;

dcl-proc stalin_sort;
    dcl-pi *n;
        array int(10) dim(6);
        size uns(3);
    end-pi;

    dcl-s i like(size);
    dcl-s write_index like(size) inz(1);
    dcl-s newsize like(size) inz(0);
    dcl-s lastval int(10) inz(*loval);

    if size <= 1;
        return;
    endif;

    for i = 1 to size;
        if array(i) >= lastval;
            lastval = array(i);
            if write_index <> i;
                array(write_index) = lastval;
            endif;
            newsize += 1;
            write_index += 1;
        endif;
    endfor;
    size = newsize;
end-proc;