import 'package:boxting/data/network/auth_api.dart';
import 'package:boxting/data/repository/register_repository_impl.dart';
import 'package:boxting/features/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class TermsScreen extends StatelessWidget {
  final data =
      '<h2><strong>REGLAMENTO DEL PROGRAMA DE BOXTING</strong></h2><p>&nbsp;</p><p>El Programa de Clientes Vivanda, en adelante EL PROGRAMA, es un programa de recompensas mediante el cual Supermercados Vivanda, en adelante LA OPERADORA, ha decidido recompensar la preferencia, frecuencia y nivel de compra de sus clientes.</p><p>El PROGRAMA tiene como herramienta principal la Tarjeta Vivanda, cuyo uso identifica a sus afiliados como clientes de Supermercados Vivanda; como tales les permite acceder a una serie de beneficios y ventajas.</p><p>El uso de la Tarjeta y EL PROGRAMA son regulados por el presente documento, así como por las disposiciones o procedimientos que en forma complementaria hayan sido o vayan a ser establecidas.</p><p>&nbsp;</p><p>El acceso, uso, registro y descarga de la información contenía en la aplicación APP VIVANDA implica la aceptación completa y sin reserva de estos Términos y Condiciones, por parte de los Clientes. Los Términos y Condiciones son vinculantes y obligatorios. Para hace uso de la aplicación APP VIVANDA deberá, además de ser Cliente, leer y aceptar el presente Reglamento del Programa de Clientes Vivanda<i><strong>.</strong></i></p><p>El Cliente reconoce que la plataforma que soporta la aplicación APP VIVANDA no es inequívoca, y por tanto, puede verificarse circunstancias ajenas a la voluntad de LA OPERADORA, que impliquen que la aplicación o la plataforma que la soporta deje de operar durante un determinado período de tiempo. En tales casos, LA OPERADORA procurará restablecer la aplicación APP VIVANDA en el más breve plazo posible, sin que por ello pueda imputársele algún tipo de responsabilidad. LA OPERADORA no garantiza la disponibilidad y continuidad del funcionamiento de la aplicación VIVANDA. LA OPERADORA no es responsable por los virus, malwares u otros elementos en el contenido de la aplicación VIVANDA que puedan generar problemas en el correcto funcionamiento del sistema informático del Cliente,</p><p>&nbsp;</p><h2><strong>I. GENERALIDADES</strong></h2><p>1. EL PROGRAMA es válido en Lima Metropolitana y la Provincia Constitucional del Callao.</p><p>2. EL PROGRAMA aplica únicamente para personas naturales.</p><p>3. Podrán afiliarse como titulares las personas mayores a 18 años. Los menores que tengan más de 16 años podrán participar únicamente como adicionales bajo autorización expresa del titular.</p><p>4. Para participar en EL PROGRAMA se debe llenar una Solicitud de Tarjeta donde el cliente deberá proporcionar sus datos.</p><p>5. El Cliente deberá informar a LA OPERADORA oportunamente cualquier cambio de domicilio, teléfono o cualquier modificación de los datos personales ya suministrados.</p><p>6. La participación en EL PROGRAMA implica la aceptación de todos los términos y condiciones del reglamento.</p><p>7. Para poder ser beneficiario del PROGRAMA, el cliente deberá presentar y pasar su tarjeta o dictar el número de su DNI en cada compra que realice en cualquier tienda Vivanda.</p><p>9. Vivanda se reserva el derecho de modificar el presente reglamento cuando lo estime necesario, lo que pondrá en conocimiento de los afiliados por el medio de comunicación que considere conveniente.</p><p>10. Si el Cliente no utiliza su Tarjeta o no dicta su DNI en las compras que realice en las tiendas Vivanda en un plazo de 12 meses, LA OPERADORA podrá dar por terminada la participación del cliente en el PROGRAMA, con la consiguiente pérdida del historial de transacciones que pudiera tener. En el supuesto descrito, la terminación será automática sin obligación de LA OPERADORA de comunicar este hecho al cliente.</p><h2><strong>II. MODO DE OBTENER BENEFICIOS</strong></h2><p>1. Todo Tarjetahabiente de Vivanda podrá acceder a los descuentos de la guía de compra y promociones de las tiendas Vivanda, además podrá ser beneficiario del PROGRAMA de acuerdo al record de compras que realice en las tiendas Vivanda, siempre que presente la tarjeta o dicte su DNI al inicio de la transacción.</p><p>2. <strong>A mayor consumo, mayor acceso a otros beneficios</strong> tales como: cuponeras de descuento, invitaciones a eventos especiales y obsequios, entre otros.&nbsp;</p><p>3. Vivanda, podrá remitir periódicamente al domicilio, vía correo electrónico, app Vivanda y&nbsp; &nbsp;mensajería SMS&nbsp;&nbsp;del cliente, información relacionada al PROGRAMA* y Vivanda.</p><h2><strong>III. VALIDEZ Y VIGENCIA DEL PROGRAMA</strong></h2><p>Vivanda puede dar por terminado EL PROGRAMA en cualquier momento. Asimismo, informará oportunamente al cliente la fecha de caducidad del PROGRAMA.</p><h2><strong>IV. BENEFICIOS</strong></h2><p>1. Cualquier información adicional respecto a la promoción puede ser solicitada directamente por el cliente en la Central de Servicio al Cliente: 620-3000 o en nuestra página de Facebook: Vivanda, piensa fresco.</p><p>2. Todos los clientes premiados autorizan a LA OPERADORA a difundir sus nombres y/o divulgar sus imágenes y fotografías en los medios y en la forma que lo considere conveniente.</p><p>3. En caso de devolución de producto, el vale o cupón utilizado no será devuelto al cliente.&nbsp;</p><h2><strong>V. SERVICIOS DE PROTECCIÓN CONTRA USO INDEBIDO</strong></h2><p>LA OPERADORA no se responsabiliza por el uso indebido de LA TARJETA en caso de pérdida o robo, hasta que haya sido bloqueada por el cliente.</p><p>&nbsp;</p><h2><strong>VI. POLITICAS&nbsp;DE DATOS PERSONALES</strong></h2><p>&nbsp;</p><p>En el marco de la Ley N° 29733 (Ley de Protección de Datos Personales) y su reglamento aprobado por Decreto Supremo N° 003-2013-JUS (“Reglamento”), te comunicamos lo siguiente:&nbsp;</p><p>&nbsp;</p><p>1.- El titular del banco de datos personales donde se almacenarán tus datos personales es Supermercados Peruanos S.A., con RUC N° 20100070970 y domicilio en&nbsp;Calle Morelli N° 181, San Borja, Lima. Dicho banco de datos se encuentra debidamente inscrito&nbsp;en el Registro Nacional de Protección de Datos Personales del Ministerio de Justicia y Derechos Humanos, bajo la denominación “Clientes” y el código: RNPDP N° 1669.&nbsp;</p><p>&nbsp;</p><p>2.- Tus datos personales serán tratados para las siguientes finalidades:</p><p>&nbsp;</p><ol><li>Gestionar tu afiliación al programa de beneficios “Tarjeta Vivanda” así como ejecutar y desarrollar dicho programa; y,</li><li>Gestionar listas de clientes, realizar estudios de mercado y evaluaciones financieras, registrar y analizar historiales de compra y elaborar perfiles de compra, efectuar acciones de publicidad y prospección comercial, ofrecimiento de promociones comerciales, fines estadísticos o históricos, comercio electrónico,&nbsp;remitir (vía medio físico, electrónico o telefónico) publicidad, obsequios, información de ofertas y/o promociones (personalizadas o generales) de productos y/o servicios.</li></ol><p>&nbsp;</p><p>Cabe indicar que para realizar las referidas finalidades podremos&nbsp;valernos de los terceros (encargados de tratamiento) que apreciarás haciendo clic en el siguiente enlace&nbsp;<a href=\"https://www.vivanda.com.pe/institucional/politica-datos/relacion-proveedores\">https://www.vivanda.com.pe/institucional/politica-datos/relacion-proveedores</a>. Según se indica en el referido enlace, algunos de dichos terceros se encuentran situados fuera del Perú, por lo que se producirá una transferencia internacional de datos.</p><p>&nbsp;</p><p>3.- Igualmente nos autorizas para transferir tus datos a las empresas que podrás apreciar haciendo clic en&nbsp;<a href=\"https://www.vivanda.com.pe/institucional/politica-datos/relacion-empresas-intercorp\">https://www.vivanda.com.pe/institucional/politica-datos/relacion-empresas-intercorp</a>,a efectos que dichas empresas realicen para sí mismas los tratamientos indicados en el literal (b) del numeral 2.</p><p>&nbsp;</p><p>4.- Entre los datos que te pedimos, algunos son de carácter obligatorio; en caso decidas no proporcionarlos, no será posible gestionar tu&nbsp;afiliación al programa de beneficios “Tarjeta Vivanda” ni realizar los demás tratamientos indicados en los numerales 2 y 3. Al&nbsp;ingresar tus datos, declaras y certificas que ellos corresponden a ti y que son verdaderos, exactos, auténticos, completos, y correctos; y que eres mayor de edad.</p><p>&nbsp;</p><p>5.- Asimismo te comunicamos que la autorización que nos brindas nos faculta para tratar (únicamente para las finalidades antes indicadas) no sólo los datos que nos has proporcionado directamente, sino también aquellos que pudieran encontrarse en fuentes accesibles para el público y/o que hayamos obtenidos de terceros; incluidos datos sensibles, de ser el caso.&nbsp;</p><p>&nbsp;</p><p>6.- Conservaremos tus datos personales mientras no nos solicites la cancelación de los mismos, en cuyo caso procederemos conforme al segundo párrafo del artículo 2.2 del Reglamento. Supermercados Peruanos S.A. tiene implementadas las medidas técnicas, organizativas y legales que garantizan la seguridad y confidencialidad de tus datos personales.&nbsp;</p><p>&nbsp;</p><p>7.-&nbsp;En cualquier momento podrás&nbsp;revocar la autorización para el tratamiento de tus datos personales, de conformidad con lo previsto en la Ley 29733 y el Reglamento. Para ejercer este derecho, o cualquier otro previsto en dichas normas, deberás presentar tu solicitud a través del enlace&nbsp;<a href=\"http://www.veaclub.com.pe/arco\">http://www.veaclub.com.pe/arco</a>, en&nbsp;Calle Morelli N° 181, San Borja, Lima, o en cualquier tienda Vivanda. Cabe indicar que el ejercicio de algunos de esos derechos (como por ejemplo el de revocación de la autorización) traerá como consecuencia dejar sin efecto tu afiliación al programa de beneficios “Tarjeta Vivanda”.&nbsp;</p>';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Términos y condiciones',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Html(data: data),
        ),
      ),
    );
  }
}
