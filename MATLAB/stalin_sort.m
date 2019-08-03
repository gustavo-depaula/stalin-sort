function [ordered_list] = stalin_sort(unordered_list)

local_max = max(triu(unordered_list(:)*ones(1,numel(unordered_list)))).';

ordered_list = unordered_list(unordered_list(:)>=local_max);
