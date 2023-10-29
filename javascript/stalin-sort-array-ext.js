if (!Array.stalinSort) {
  Array.prototype.stalinSort = function(compFn) {
    let i = 1, j = 1
    let len = this.length
    if (typeof compFn != 'function') {
      compFn = function(a, b) {
        return (b < a) ? -1 : 0
      }
    }
    for (; i < len; i++) {
      if (compFn(this[j - 1], this[i]) >= 0) {
        this[j] = this[i]
        j++
      }
    }
    this.length = j
    return this
  }
}
