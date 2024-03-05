import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import cafe.adriel.voyager.core.model.ScreenModel
import cafe.adriel.voyager.core.screen.Screen
import cafe.adriel.voyager.koin.getScreenModel
import cafe.adriel.voyager.navigator.Navigator
import org.koin.compose.KoinApplication

@Composable
fun App() {
    KoinApplication(application = {
        modules(platformModule)
    }) {
        MaterialTheme {
            Navigator(StartScreen())
        }
    }
}

class StartScreenModel(
    private val userRepository: UserRepository
) : ScreenModel {
    fun users(): List<User> {
        return userRepository.users()
    }

    fun addUser(user: User) {
        userRepository.addUsers(listOf(user))
    }
}

class StartScreen : Screen {
    @Composable
    override fun Content() {
        val screenModel = getScreenModel<StartScreenModel>()

        screenModel.addUser(User("Aaron Housh"))

        Column(Modifier.fillMaxWidth()) {
            screenModel.users().forEach { user ->
                Text(user.name)
            }
        }
    }
}



