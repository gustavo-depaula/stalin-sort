inline int stalin_sort(int *restrict dest, const int *restrict src, int count) {
    if (count == 0) return 0;
    dest[0]         = src[0];
    int new_count   = 1;
    int running_max = src[0];
    __attribute__((aligned(64))) const int index_table[4][16] = {
        {0,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}, // step 0, shift 1
        {0,0,0,1,2,3,4,5,6,7,8, 9,10,11,12,13}, // step 1, shift 2  
        {0,0,0,0,0,1,2,3,4,5,6, 7, 8, 9,10,11}, // step 2, shift 4
        {0,0,0,0,0,0,0,0,0,1,2, 3, 4, 5, 6, 7}  // step 3, shift 8
    };

    int i;
    for (i = 1; i + 16 <= count; i += 16) {
        __m512i current    = _mm512_loadu_si512((__m512i const*)(src + i));
        __m512i prefix_max = current;
        __m512i prev_max   = _mm512_set1_epi32(running_max);

        for (int step = 0; step < 4; step++) {
            __m512i idx     = _mm512_loadu_si512(index_table[step]);
            __m512i shifted = _mm512_permutexvar_epi32(idx, prefix_max);
            prefix_max      = _mm512_max_epi32(prefix_max, shifted);
        }
 
        // Compare with running max from previous iteration
        prefix_max = _mm512_max_epi32(prefix_max, prev_max);
        
        // Compare current values against prefix max shifted by 1
        __m512i shifted_prefix = _mm512_permutexvar_epi32(_mm512_loadu_si512(index_table[0]), prefix_max);
        __mmask16 mask         = _mm512_cmpge_epi32_mask(current, shifted_prefix);   // Create mask where current >= prefix
        _mm512_mask_compressstoreu_epi32(dest + new_count, mask, current);           // Store elements that pass
        running_max = _mm512_reduce_max_epi32(prefix_max);                           // Update running max
        new_count  += _mm_popcnt_u32(mask);
    }
    
    // Handle remaining elements
    for (; i < count; ++i) {
        if (src[i] >= running_max) {
            dest[new_count++] = src[i];
            running_max       = src[i];
        }
    }
    
    return new_count;
}
