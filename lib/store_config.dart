import 'stores.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StoreConfig {
  StoreConfig({
    this.title,
    this.icon,
    this.website,
  });

  String? title;
  String? icon;
  String? website;

  static StoreConfig getStoreName() {
    String STORE_BAN = dotenv.env['STORE_BANNER'] ?? 'STORE_BANNER NOT FOUND';
    //***************************************************************** Change the name of the Store from Here ************************************************ */
    String currentStore = STORE_BAN;
    //********************************************************************************************************************************************************* */
    if (currentStore == "BASE") {
      return StoreConfig(
          title: "Jesta I.S",
          website: "jestais.com",
          icon: "lib/assets/JESTA.png");
    }
    if (currentStore == "JDSPORTS") {
      return StoreConfig(
          title: "JD Sports",
          website: "JDSPORTS.CA",
          icon: "lib/assets/JDLogo.png");
    }
    if (currentStore == "LSWEB") {
      return StoreConfig(
          title: "Livestock",
          website: "deadstock.ca",
          icon: "lib/assets/Livestock_Logo.png");
    }
    if (currentStore == "SZWEB") {
      return StoreConfig(
          title: "Size", website: "SIZE.CA", icon: "lib/assets/Size_Logo.png");
    }

    return StoreConfig(
        title: "Undefined", website: "Undefined", icon: "Undefined");
  }
}
