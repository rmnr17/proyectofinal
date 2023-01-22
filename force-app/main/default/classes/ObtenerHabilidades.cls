public with sharing class ObtenerHabilidades {
    public static void CalloutAbilities() {
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
        // si la respuesta es exitosa
        if (res.getStatusCode() == 200) {
            // Obtengo el json
            String jsonString = res.getBody();
            // Mapeo los datos hasta llegar al nodo que me interesa
            Map<String, Object> pokemon = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
            List<Object> abilities = (List<Object>) pokemon.get('abilities');
            //Como son varios valores voy recorriendo el arreglo
            for(Object ability : abilities){
                  Map<String, Object> ability1 = (Map<String, Object>) ability;
                  Map<String, Object> ability2 = (Map<String, Object>) ability1.get('ability');
                  String abilityName = (String) ability2.get('name');
        		  System.debug('Habilidad:' + abilityName);
    		}

            // Asigno los valores a los campos
            ExtId = (Integer) pokemon.get('id');
            Nombre = (String) pokemon.get('name');
            System.debug('Este es el ExtId ' + ExtId);
            
        }
    }
}