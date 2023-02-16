import 'package:realm/realm.dart';

import 'model/configuration_model.dart';

var config = Configuration.local(
  [
    ConfigurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
);
