//
//  YKAppDelegate.m
//  Youkeyword
//
//  Created by apium on 28/12/13.
//  Copyright (c) 2013 apium. All rights reserved.
//

#import "YKAppDelegate.h"
#import "YKNote.h"

@implementation YKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // create some notes!
    self.notes = [NSMutableArray arrayWithArray: @[
            [YKNote noteWithText:@"Luís Alves de Lima e Silva,\r Duke of Caxias (1803–80) was an army officer, politician and monarchist of the Empire of Brazil. politician and monarchist of the Empire of Brazil. He fought against Portugal during the Brazilian War for Independence, and thereafter remained loyal to the emperors Dom Pedro I and his son, Dom Pedro II (to whom he became a friend and instructor in swordsmanship and horsemanship). He commanded forces that put down uprisings from 1839 to 1845, including the Balaiada and the War of the Ragamuffins. He led the Brazilian army to victory in the Platine War against the Argentine Confederation and in the Paraguayan War against the Paraguayans. Caxias was promoted to army marshal, the army's highest rank, and was the only person made a duke during the 58-year reign of Pedro II. A member of the Reactionary Party (which became the Conservative Party), he was elected senator in 1846 and served as president (prime minister) of the Council of Ministers three times. Historians have regarded Caxias in a positive light and several have ranked him as the greatest Brazilian military officer. He has been designated as the army's protector, and is regarded as the most important figure in its tradition."],
            [YKNote noteWithText:@"Ejemplo de texto en español:\rLa novela consta de dos partes: la primera, El ingenioso hidalgo don Quijote de la Mancha, fue publicada en 1605; la segunda, Segunda parte del ingenioso caballero don Quijote de la Mancha, en 1615.4\n"
                    "La primera parte se imprimió en Madrid, en casa de Juan de la Cuesta, a finales de 1604. Salió a la venta en enero de 1605 con numerosas erratas, por culpa de la celeridad que imponía el contrato de edición. Esta edición se reimprimió en el mismo año y en el mismo taller, de forma que hay en realidad dos ediciones de 1605 ligeramente distintas. Se sospecha, sin embargo, que existió una novela más corta, que sería una de sus futuras Novelas ejemplares. Fue divulgada o impresa con el título El ingenioso hidalgo de la Mancha. Esa publicación se ha perdido, pero autores como Francisco López de Úbeda o Lope de Vega, entre otros testimonios, aluden a la fama de esta pieza. Tal vez circulaba manuscrita e, incluso, podría ser una primera parte de 1604. También el toledano Ibrahim Taybilí, de nombre cristiano Juan Pérez y el escritor morisco más conocido entre los establecidos en Túnez tras la expulsión general de 1609-1612, narró una visita en 1604 a una librería en Alcalá en donde adquirió las Epístolas familiares y el Relox de Príncipes de Fray Antonio de Guevara y la Historia imperial y cesárea de Pedro Mexía. En ese mismo pasaje se burla de los libros de caballerías de moda y cita como obra conocida el Quijote. Eso le permitió a Jaime Oliver Asín añadir un dato a favor de la posible existencia de una discutida edición anterior a la de 1605.\n"
                    "La inspiración de Cervantes para componer esta obra vino, al parecer, del llamado Entremés de los romances, que era de fecha anterior (aunque esto es discutido). Su argumento ridiculiza a un labrador que enloquece creyéndose héroe de romances. El labrador abandonó a su mujer, y se echó a los caminos, como hizo don Quijote. Este entremés posee una doble lectura: también es una crítica a Lope de Vega; quien, después de haber compuesto numerosos romances autobiográficos en los que contaba sus amores, abandonó a su mujer y marchó a la Armada Invencible. Es conocido el interés de Cervantes por el Romancero y su resentimiento por haber sido echado de los teatros por el mayor éxito de Lope de Vega, así como su carácter de gran entremesista. Un argumento a favor de esta hipótesis sería el hecho de que, a pesar de que el narrador nos dice que don Quijote ha enloquecido a causa de la lectura de libros de caballerías, durante su primera salida recita romances constantemente, sobre todo en los momentos de mayor desvarío. Por todo ello, podría ser una hipótesis verosímil. A este influjo se agregó el de Tirante el Blanco de Joanot Martorell, el del Morgante de Luigi Pulci y el del Orlando Furioso de Ludovico Ariosto. Otros críticos sostienen que es posible localizar la inspiración de Cervantes en El asno de oro de Apuleyo.5\n"
                    "La primera parte, en que se alargaba la previa «novela ejemplar», se repartió en cuatro volúmenes. Conoció un éxito formidable y fue traducida a todas las lenguas cultas de Europa. Sin embargo, no supuso un gran beneficio económico para el autor a causa de las ediciones piratas. Cervantes sólo reservó privilegio de impresión para el reino de Castilla, con lo que los reinos aledaños imprimieron Quijotes más baratos que luego venderían en Castilla. Por otra parte, las críticas de carácter neoaristotélico hacia la nueva fórmula teatral ensayada por Lope de Vega y el hecho de inspirarse en un entremés en que se le atacaba, supuso atraer la inquina de los lopistas y del propio Lope; quien, hasta entonces, había sido amigo de Cervantes. Eso motivó que, en 1614, saliera una segunda parte de la obra bajo el nombre de Alonso Fernández de Avellaneda. En el prólogo se ofende gravemente a Cervantes tachándole de envidioso, en respuesta al agravio infligido a Lope. No se tienen noticias de quién era este Fernández de Avellaneda. Un importante cervantista, Martín de Riquer, sospecha que fue otro personaje real, Jerónimo de Pasamonte, un militar compañero de Cervantes y autor de un libro autobiográfico, agraviado por la publicación de la primera parte, donde aparece como el galeote Ginés de Pasamonte. La novela no es mala y es posible, incluso, que se inspirara en la continuación que estaba elaborando Cervantes. Aun así, no es comparable a la que se imprimió después. Cervantes jugaría con el hecho de que el protagonista en su obra se entera de que existía un suplantador."],

    ]];

    // style the navigation bar
    UIColor* navColor = [UIColor colorWithRed:0.175f green:0.458f blue:0.831f alpha:1.0f];
    [[UINavigationBar appearance] setBarTintColor:navColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

    // make the status bar white
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
