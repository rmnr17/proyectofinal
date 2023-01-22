public class AbilitiesCapture {

    //URL base para la API de pokeapi.co
    private static final String BASE_URL = 'https://pokeapi.co/api/v2/';
    
    //Método para obtener una habilidad específica
    public static Ability getAbility(Integer abilityId) {
        //Crear una nueva petición HTTP
        Http http = new Http();
        //Crear una nueva petición GET
        HttpRequest request = new HttpRequest();
        //Establecer la URL para la petición
        request.setEndpoint(BASE_URL + 'ability/' + abilityId);
        //Enviar la petición
        HttpResponse response = http.send(request);
        //Validar que la respuesta sea correcta
        if (response.getStatusCode() == 200) {
            //Deserializar el cuerpo de la respuesta a un objeto Ability
            Ability ability = (Ability) JSON.deserialize(response.getBody(), Ability.class);
            return ability;
        } else {
            //En caso de que la respuesta no sea correcta, retornar nulo
            return null;
        }
    }
    
    //Método para relacionar una habilidad con un Pokémon
    public static PokemonAbility getPokemonAbility(Integer abilityId) {
        //Obtener la habilidad específica
        Ability ability = getAbility(abilityId);
        if(ability!=null){
            //Crear un nuevo objeto PokemonAbility
            PokemonAbility pokemonAbility = new PokemonAbility();
            //Establecer la habilidad en el objeto PokemonAbility
            pokemonAbility.ability = ability;
            //Obtener un Pokémon al azar de la lista de Pokémon relacionados con la habilidad
            Integer randomIndex = Math.floor(Math.random() * ability.pokemon.size()).intValue();
            pokemonAbility.pokemon = ability.pokemon[randomIndex];
            return pokemonAbility;
        }else{
            return null;
        }
    }
    
    //Clase Ability para almacenar la información de una habilidad
    public class Ability {
        public String name;
        public List<Pokemon> pokemon;
    }
    
    //Clase PokemonAbility para almacenar la información de una habilidad relacionada con un Pokémon
    public class PokemonAbility {
        public Ability ability;
        public Pokemon pokemon;
    }
    
    //Clase Pokemon para almacenar la información de un Pokémon
    public class Pokemon {
        public String name;
    }
}