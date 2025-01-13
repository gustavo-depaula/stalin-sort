inline int stalin_sort(int *restrict dest, const int *restrict src, int count) {
    if (count == 0) return 0;
    
    dest[0]         = src[0];
    int new_count   = 1;
    int running_max = src[0];

    __m512i shifted, current, prefix_max, prev_max;
    __mmask16 mask; 
    const __m512i ZERO = _mm512_setzero_si512();

    int i;
    #pragma unroll
    for (i = 1; i + 16 <= count; i += 16) {
        current    = _mm512_loadu_si512((__m512i const*)(src + i));
        prefix_max = current;
        prev_max   = _mm512_set1_epi32(running_max);
        
        shifted    = _mm512_alignr_epi32(prefix_max, ZERO, 15);
        prefix_max = _mm512_max_epi32(prefix_max, shifted);
        shifted    = _mm512_alignr_epi32(prefix_max, ZERO, 14);
        prefix_max = _mm512_max_epi32(prefix_max, shifted);
        shifted    = _mm512_alignr_epi32(prefix_max, ZERO, 12);
        prefix_max = _mm512_max_epi32(prefix_max, shifted);
        shifted    = _mm512_alignr_epi32(prefix_max, ZERO,  8);
        prefix_max = _mm512_max_epi32(prefix_max, shifted);
 
        prefix_max = _mm512_max_epi32(prefix_max, prev_max);    
        shifted    = _mm512_mask_expand_epi32(_mm512_alignr_epi32(prefix_max, ZERO, 15), 0x0001, prefix_max);
        mask       = _mm512_cmpge_epi32_mask(current, shifted);                // Create mask where current >= prefix
        _mm512_mask_compressstoreu_epi32(dest + new_count, mask, current);     // Store elements that pass
        running_max = _mm512_reduce_max_epi32(prefix_max);                     // Update running max
        new_count  += _mm_popcnt_u32(mask);
    }
    
    // Handle remaining elements
    for (; i < count; ++i) {
        if (src[i] >= running_max) {
            dest[new_count++] = running_max = src[i];
        }
    }
    
    return new_count;
}
