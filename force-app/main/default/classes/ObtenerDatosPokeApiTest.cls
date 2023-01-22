@isTest
public class ObtenerDatosPokeApiTest {
    @isTest
        static void testMakeCallout() {
        ObtenerDatosPokeApi.makeCallout();
        // Verificar que el código está asignando correctamente los valores a las variables
        System.assertEquals(1, ObtenerDatosPokeApi.ExtId);
        System.assertEquals('bulbasaur', ObtenerDatosPokeApi.Nombre);
        System.assertEquals(69.0, ObtenerDatosPokeApi.Peso);
        System.assertEquals(7.0, ObtenerDatosPokeApi.Altura);
    }
}