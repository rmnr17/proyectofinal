public class PokemonBatch implements Database.Batchable<Integer> {
    //URL base para la API de pokeapi.co
    private static final String BASE_URL = 'https://pokeapi.co/api/v2/pokemon/';

    //Lista para almacenar los pokemones obtenidos
    public List<Pokemon> pokemonList = new List<Pokemon>();

    //Método para obtener el rango de procesamiento
    public Iterable<Integer> start(Database.BatchableContext bc) {
        //Retornar un rango de números del 1 al 3
        return new List<Integer>{1, 2, 3};
    }

    //Método para procesar cada uno de los elementos del rango
    public void execute(Database.BatchableContext bc, List<Integer> scope) {
        for (Integer id : scope) {
            //Crear una nueva petición HTTP
            Http http = new Http();
            //Crear una nueva petición GET
            HttpRequest request = new HttpRequest();
            //Establecer la URL para la petición
            request.setEndpoint('https://pokeapi.co/pokemon');
            //Enviar la petición
            HttpResponse response = http.send(request);
            //Validar que la respuesta sea correcta
            if (response.getStatusCode() == 200) {
                //Deserializar el cuerpo de la respuesta a un objeto Pokemon
                Pokemon pokemon = (Pokemon) JSON.deserialize(response.getBody(), Pokemon.class);
                pokemonList.add(pokemon);
            }
        }
    }

    //Método para finalizar el proceso
    public void finish(Database.BatchableContext bc) {
        //Imprimir la lista de pokemones obtenidos
        for (Pokemon p : pokemonList) {
            System.debug(p);
        }
    }

    //Clase Pokemon para almacenar la información de un Pokémon
    public class Pokemon {
        public String name;
        public String url;
    }
}