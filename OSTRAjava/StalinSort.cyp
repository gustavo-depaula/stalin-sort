//by Komseb & Krepsy3, 2023

banik pyco

tryda Ostrava {
    statyk cyslo mynymum(cyslo a, cyslo b) {
        kaj (a <= b) {
            davaj a pyco
        }
        boinak {
            davaj b pyco
        }
    }

    statyk cyslo[] kopyjePole(cyslo[] pole, cyslo pocet) {
        toz cyslo[] vysledek = zrob cyslo[pocet] pyco
        toz cyslo i = 0 pyco
        toz cyslo nejvyc = mynymum(Pole.velikost(pole), pocet) pyco
        rubat (i < nejvyc) {
            vysledek[i] = pole[i] pyco
        }

        davaj vysledek pyco
    }

    statyk cyslo[] stalinSort(cyslo[] array) {
        array = kopyjePole(array, Pole.velikost(pole)) pyco

        toz cyslo i = 0 pyco
        toz cyslo j = 1 pyco
        rubat ( j < Pole.velikost(array)) {
            kaj (array[i] > array[j]) {
                i = i - 1 pyco
            } 
            kajtez (j - i > 1) {
                array[i + 1] = array[j] pyco
            }

            i = i + 1 pyco
            j = j + 1 pyco
        }
        davaj kopyjePole(array, i + 1) pyco
    }

    rynek() {
        printArrays(zrob cyslo[] {1, 2, 3, 4, 5, 6, 7, 8, 9}, "Sorted array") pyco
        printArrays(zrob cyslo[] {1, 0, 3, 4, 5, 8, 6, 7, 9}, "Array with mixed numbers") pyco
        printArrays(zrob cyslo[] {1, 1, 1, 1, 2, 2, 2, 3, 4}, "Sorted array with repeats") pyco
        printArrays(zrob cyslo[] {9, 8, 7, 6, 5, 4, 3, 2, 1}, "Reversed array") pyco
    }

    statyk printArrays(cyslo[] sourceArray, Dryst testName) {
        Konzola.pravit("\n" + testName + ":") pyco
        Konzola.pravit("Source array: " + sourceArray.naDryst()) pyco
        Konzola.pravit("Result array: " + (stalinSort(sourceArray)).naDryst()) pyco
    }
}

fajront pyco