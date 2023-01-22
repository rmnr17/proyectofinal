public class GetAllMoves {
	public static void MoveInformation() {
        String Nombre, TypeName, EffectChance, TargetName; 
        Integer ExtId, n, Accuracy, Priority1,Pp1, Power1;
        n=1;
        Http h = new Http();
        //variable req guarda valores requerimiento
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/move/' + n);
        req.setMethod('GET');
        //variable res guarda respuesta a requerimiento
        HttpResponse res = h.send(req);
        // si la respuesta es exitosa
        if (res.getStatusCode() == 200) {
            // Obtengo el json
            String jsonString = res.getBody();
            // Mapeo los datos hasta llegar al nodo que me interesa
            Map<String, Object> MoveDetail = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
 			//Obtengo los efectos: effect_entries, short_effect
 			List<Object> effectEntries =  (List<Object>) MoveDetail.get('effect_entries');
			Map<String, Object> effectEntriesMap = (Map<String, Object>) effectEntries[0];
			String ShortEffect = (String) effectEntriesMap.get('short_effect');
            //Busco el target_name
            Map<String, Object> target = (Map<String, Object>) MoveDetail.get('target');
				TargetName = (String) target.get('name');
           //Busco el nombre del Tipo en la lista String
             Map<String, Object> type = (Map<String, Object>) MoveDetail.get('type');
				TypeName = (String) type.get('name');
              	ExtId = (Integer) MoveDetail.get('id');
              	System.debug('Este es el ExtId ' + ExtId);
            	Nombre = (String) MoveDetail.get('name');
            	Nombre = Nombre.capitalize();
	            System.debug('Este es el Nombre ' + Nombre);
            	Accuracy = (Integer) MoveDetail.get('accuracy');
	            System.debug('Esta es la puntería ' + Accuracy);
            	EffectChance = (String) MoveDetail.get('effect_chance');
	            System.debug('Este es el efect Chance ' + EffectChance);
            	Priority1 = (Integer) MoveDetail.get('priority');
            	System.debug('Valor de prioridad del movimiento: ' + Priority1);
            	Pp1 = (Integer) MoveDetail.get('pp');
            	System.debug('Valor de pp: ' + Pp1);
            	Power1 = (Integer) MoveDetail.get('power');
            	System.debug('Power del movimiento: ' + Power1);
            	System.debug('Efecto del movimiento: ' + ShortEffect);
				System.debug('Tipo: ' + TypeName);
				System.debug('Objetivo: ' + TargetName);            
             }
 		}  
}