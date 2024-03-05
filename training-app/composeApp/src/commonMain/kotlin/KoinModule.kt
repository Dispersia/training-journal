import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module

val platformModule =
    module {
        single<UserRepository> { UserRepositoryImpl() }
        factory { StartScreenModel(get()) }
    }



data class User(val name: String)

interface UserRepository {
    fun findUser(name: String): User?

    fun addUsers(users: List<User>)

    fun users(): List<User>
}

class UserRepositoryImpl : UserRepository {
    private val usersCache = arrayListOf<User>()

    override fun findUser(name: String): User? {
        return usersCache.firstOrNull { u -> u.name == name }
    }

    override fun addUsers(users: List<User>) {
        usersCache.addAll(users)
    }

    override fun users(): List<User> {
        return usersCache
    }
}
