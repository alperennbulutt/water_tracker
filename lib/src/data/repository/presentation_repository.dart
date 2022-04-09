import 'package:water_tracker/src/data/provider/api.dart';

class PresentationRepository {
  final MyApiClient api;

  PresentationRepository(this.api);

  getAll() {
    return api.getAll();
  }

  getId(id) {
    return api.getId(id);
  }

// delete(id){
//   return api.delete(id);
// }
// edit(obj){
//   return api.edit( obj );
// }
// add(obj){
//     return api.add( obj );
// }

}
