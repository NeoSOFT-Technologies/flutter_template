import 'package:data/data.dart';

import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  void fetchPosts() {
    // TODO: implement fetchPosts
  }
}
