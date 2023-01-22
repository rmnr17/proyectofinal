public class GetAllAbilities {
 public static void AbilitiesDetails() {
        String Nombre, Nombre2; 
        Integer ExtId, n;
        n=1;
        Http h = new Http();
        //variable req guarda valores requerimiento
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/ability/' + n);
        req.setMethod('GET');
        //variable res guarda respuesta a requerimiento
        HttpResponse res = h.send(req);
        // si la respuesta es exitosa
        if (res.getStatusCode() == 200) {
            // Obtengo el json
            String jsonString = res.getBody();
            // Mapeo los datos hasta llegar al nodo que me interesa
            Map<String, Object> AllAbilities = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
            List<Object> abilities = (List<Object>) AllAbilities.get('names');
            //Como son varios valores voy recorriendo el arreglo
            for(Object name : abilities){
                  Map<String, Object> name1 = (Map<String, Object>) name;
                  Map<String, Object> name2 = (Map<String, Object>) name1.get('language');
                  String Language = (String) name2.get('name');
                 // Obteniendo la lista "en"
				 if (Language == 'en') {
                     Nombre = (String) name1.get('name');
                     Nombre.capitalize();
                     System.debug('Valor encontrado: ' + Nombre);
        			break;
    				}
			}
            List<Object> effectEntries = (List<Object>) AllAbilities.get('effect_entries');
			for(Object effect : effectEntries){
    			Map<String, Object> effect1 = (Map<String, Object>) effect;
    			Map<String, Object> effect2 = (Map<String, Object>) effect1.get('language');
                String Language = (String) effect2.get('name');
    			if (Language == 'en') {
        				String effectValue = (String) effect1.get('short_effect');
        				System.debug('Valor encontrado: ' + effectValue);
        				break;
    			}
			}
               ExtId = (Integer) AllAbilities.get('id');
             System.debug('Este es el ExtId ' + ExtId);
 		}
        	  
            // Asigno los valores a los campos
           
            //Nombre = (String) pokemon.get('name');
            
            
   }
}