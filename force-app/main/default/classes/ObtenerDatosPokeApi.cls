public with sharing class ObtenerDatosPokeApi {
    public static Integer ExtId;
    public static String Nombre;
    public static Double Peso;
    public static Double Altura;
    public static void makeCallout() {
        String Nombre, Tipos, StatName; 
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
            // Mapeo los datos
            Map<String, Object> pokemon = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
            //Obtengo los stats: Defensa, hp, attack, etc
            List<Object> stats = (List<Object>) pokemon.get('stats');
            for(Object stat : stats){
                  Map<String, Object> stats1 = (Map<String, Object>) stat;
                  Map<String, Object> stats2 = (Map<String, Object>) stats1.get('stat');
                  StatName = (String) stats2.get('name');
        	      Integer baseStat = (Integer) stats1.get('base_stat');
        		  System.debug(StatName + ':' + baseStat);
                  Integer Vida = (Integer) baseStat;
    		}
			//Obtengo los datos de los tipos
			List<Object> types = (List<Object>) pokemon.get('types');
            for(Object type : types){
                  Map<String, Object> types1 = (Map<String, Object>) type;
                  Map<String, Object> types2 = (Map<String, Object>) types1.get('type');
                  Integer Slot = (Integer) types1.get('slot');
                  String TypeName = (String) types2.get('name');
        	      System.debug('Slot:' + Slot + TypeName);    
    		}
            //Obtengo la imagen: sprite
            Map<String,Object> sprites = (Map<String,Object>) pokemon.get('sprites');
			String Imagen = (String) sprites.get('front_default');
            System.debug('Imagen:' + Imagen);    
    		
            // Asigno los valores a los campos
            ExtId = (Integer) pokemon.get('id');
            Nombre = (String) pokemon.get('name');
            Nombre = Nombre.capitalize();
            Peso = (Double) pokemon.get('weight');
            Altura = (Double) pokemon.get('height');
          
            //Imagen = (String) pokemon.get('sprites');
            //Tipos = (String) pokemon.get('types');
            System.debug('Este es el ExtId ' + ExtId);
            System.debug('Este es el Nombre ' + Nombre);
            System.debug('Este es el Peso: ' + Peso);
            System.debug('Esta es la Altura: ' + Altura);
            System.debug('Esta es la Imagen: ' + pokemon.get('sprites'));
         
        }
    }
}