global class GetAbilitiesBatch implements Database.Batchable<Integer> {
    global Iterable<Integer> start(Database.BatchableContext bc) {
        List<Integer> abilityIds = new List<Integer>();
        for (Integer i = 1; i <= 7; i++) {
            abilityIds.add(i);
        }
        return abilityIds;
    }

    global void execute(Database.BatchableContext bc, List<Integer> scope) {
        String ids = String.join(scope, ',');
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/ability/' + ids);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        if (res.getStatusCode() == 200) {
            String jsonString = res.getBody();
            List<Object> AllAbilities = (List<Object>) JSON.deserializeUntyped(jsonString);
            for(Object ability : AllAbilities){
                Map<String, Object> ability1 = (Map<String, Object>) ability;
                List<Object> abilities = (List<Object>) ability1.get('names');
                for(Object name : abilities){
                      Map<String, Object> name1 = (Map<String, Object>) name;
                      Map<String, Object> name2 = (Map<String, Object>) name1.get('language');
                      String Language = (String) name2.get('name');
                      if (Language == 'en') {
                         String Nombre = (String) name1.get('name');
                         Nombre.capitalize();
                         System.debug('Valor encontrado: ' + Nombre);
                         break;
                      }
                }
                List<Object> effectEntries = (List<Object>) ability1.get('effect_entries');
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
                Integer ExtId = (Integer) ability1.get('id');
                System.debug('Este es el ExtId ' + ExtId);
            }
        }
    }
    global void finish(Database.BatchableContext bc) {
    }
}