public with sharing class PokemonMotion {
    public static void getPokemonMoves() {
        String Nombre, Imagen, Tipos, StatName; 
        Double Peso, Altura;
        Integer ExtId, n;
        n=1;
        Http h = new Http();
        //variable req guarda valores requerimiento
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + n);
        req.setMethod('GET');
        //variable res guarda respuesta a requerimiento
        HttpResponse res = h.send(req);
         System.debug(res.getBody());
        // si la respuesta es exitosa
        if (res.getStatusCode() == 200) {
            // Obtengo el json
            String jsonString = res.getBody();
            // Mapeo los datos
            Map<String, Object> pokemon = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
            List<Object> moves = (List<Object>) pokemon.get('moves');
            for(Object move : moves){
                  Map<String, Object> moves1 = (Map<String, Object>) move;
                  Map<String, Object> moves2 = (Map<String, Object>) moves1.get('move');
                  String moveName = (String) moves2.get('name');
        		  System.debug('Movimiento:' + moveName);
    		}

          
            // Asigno los valores a los campos
            ExtId = (Integer) pokemon.get('id');
            Nombre = (String) pokemon.get('name');
            System.debug('Este es el ExtId ' + ExtId);
            
        }
    }
}