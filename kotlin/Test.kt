import java.util.concurrent.Callable
import kotlin.random.Random
import kotlin.time.measureTime
import kotlin.time.measureTimedValue

fun main() {
    emptyTest()
    simpleTest()
    comradesTest()
    stressTest()
    measureStalinSortTime { Random.nextInt() }
    measureStalinSortTime { RedArmyRank.entries.random() }
    val k = mutableListOf(1, 2, 3)
    k.sorted()
}

fun emptyTest() {
    val nothing: List<Int> = emptyList()
    kgbCheck(nothing, nothing.sortComrades(), "sortComrades")
    kgbCheck(nothing, nothing.stalinSorted(), "stalinSorted")
    kgbCheck(nothing, nothing.toMutableList().also { it.stalinSort() }, "stalinSort")
    println("simple test OK")
}

fun simpleTest() {
    val intList = listOf(1, 2, 3, 4, 5, 2)
    val stalinSorted = listOf(1, 2, 3, 4, 5)
    kgbCheck(stalinSorted, intList.sortComrades(), "sortComrades")
    kgbCheck(stalinSorted, intList.stalinSorted(), "stalinSorted")
    kgbCheck(stalinSorted, intList.toMutableList().also { it.stalinSort() }, "stalinSort")
    println("simple test OK")
}

fun comradesTest() {
    val dickwadList = listOf(
        RedArmyDickwad("Pablo", RedArmyRank.NOT_EVEN_RUSSIAN),
        RedArmyDickwad("Legasov", RedArmyRank.SQUAD_LEADER),
        RedArmyDickwad("You", RedArmyRank.SOLDIER),
        RedArmyDickwad("Dyatlov", RedArmyRank.SQUAD_LEADER),
        RedArmyDickwad("Trotsky", RedArmyRank.ASSISTANT_PLATOON_LEADER),
        RedArmyDickwad("Shcherbina", RedArmyRank.SQUAD_LEADER),
        RedArmyDickwad("Stalin", RedArmyRank.SUPREME_COMMANDER),
        RedArmyDickwad("Gorki", RedArmyRank.BEAR_RIDER),
        RedArmyDickwad("Voroshilov", RedArmyRank.COMPANY_SERGEANT)
    )
    val stalinSorted = dickwadList.slice(listOf(0, 1, 3, 4, 6))
    kgbCheck(stalinSorted, dickwadList.sortComrades(), "sortComrades")
    kgbCheck(stalinSorted, dickwadList.stalinSorted(), "stalinSorted")
    kgbCheck(stalinSorted, dickwadList.toMutableList().also { it.stalinSort() }, "stalinSort")
    println("comrades test OK")
}

fun stressTest() {
    repeat(10) {
        val stalinSort = MutableList(10000) { Random.nextDouble() }
        val sortComrades = stalinSort.sortComrades()
        val stalinSorted = stalinSort.stalinSorted()
        stalinSort.stalinSort()
        kgbCheck(stalinSort, sortComrades, "stalinSort vs sortComrades")
        kgbCheck(sortComrades, stalinSorted, "sortComrades vs stalinSorted")
    }
    println("stress test OK")
}

fun <T : Comparable<T>> measureStalinSortTime(provider: Callable<T>) {
    val scTimes: MutableList<Long> = mutableListOf()
    val ssTimes: MutableList<Long> = mutableListOf()
    val ssdTimes: MutableList<Long> = mutableListOf()
    repeat(10) {
        val randomList = MutableList(100000) { provider.call() }
        val (sortComrades, sortComradesTime) = measureTimedValue { randomList.sortComrades() }
        val (stalinSorted, stalinSortedTime) = measureTimedValue { randomList.stalinSorted() }
        val stalinSort = randomList.toMutableList()
        val stalinSortTime = measureTime { stalinSort.stalinSort() }
        assert(sortComrades == stalinSorted)
        assert(stalinSorted == stalinSort)
        if (it > 4) {
            scTimes.add(sortComradesTime.inWholeNanoseconds)
            ssTimes.add(stalinSortedTime.inWholeNanoseconds)
            ssdTimes.add(stalinSortTime.inWholeNanoseconds)
        }
    }
    println("sortComrades time: ${scTimes.average()}")
    println("stalinSorted time: ${ssTimes.average()}")
    println("stalinSort time: ${ssdTimes.average()}")
}


enum class RedArmyRank {
    NOT_EVEN_RUSSIAN,
    SOLDIER,
    SQUAD_LEADER,
    ASSISTANT_PLATOON_LEADER,
    COMPANY_SERGEANT,
    BEAR_RIDER,
    SUPREME_COMMANDER
}

data class RedArmyDickwad(
    val name: String,
    val rank: RedArmyRank
) : Comparable<RedArmyDickwad> {
    override operator fun compareTo(other: RedArmyDickwad) = rank.compareTo(other.rank)
}

fun <T> kgbCheck(expected: T, actual: T, whoToBlame: String) =
    check(expected == actual) {
        """KGB finds $whoToBlame unsatisfactory
            Expected: $expected
            Actual: $actual
            """.trimIndent()
    }