fun main(args: Array<String>) {
	val intComrades = listOf(0, 2, 1, 4, 3, 6, 5).sortComrades()
    
    val charComrades = listOf('A', 'C', 'B', 'E', 'D').sortComrades()

    val redArmyRanks =  listOf(
        RedArmyRank.SOLDIER, 
        RedArmyRank.ASSISTANT_PLATOON_LEADER,
        RedArmyRank.SQUAD_LEADER).sortComrades()
    
    val dickwads = listOf(
        RedArmyDickwad("Stalin", RedArmyRank.SUPREME_COMMANDER),
        RedArmyDickwad("Pablo", RedArmyRank.NOT_EVEN_RUSSIAN),
        RedArmyDickwad("Putin", RedArmyRank.BEAR_RIDER)).sortComrades()
    
    println("$intComrades\n$charComrades\n$redArmyRanks\n$dickwads")
}

inline fun <reified T> Iterable<Comparable<T>>.sortComrades(): List<T> = foldIndexed(mutableListOf<T>()) { index, sortedComrades, comrade ->
    if (index > 0) {
        if (comrade > sortedComrades.last())
            sortedComrades += comrade as T
    } else {
        sortedComrades += comrade as T
    }
                                                               
	sortedComrades
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
