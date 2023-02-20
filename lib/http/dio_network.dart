import 'package:dio/dio.dart';
import 'package:flutter_v2ex/http/init.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_v2ex/models/item_node.dart';

class DioRequestNet {
  // 所有节点
  final String allNodes = '/api/nodes/all.json';

  static Future<List<NodeItem>> getAllNodes() async {
    Response response = await Request().get(
      DioRequestNet().allNodes,
      cacheOptions: buildCacheOptions(
        const Duration(days: 4),
        forceRefresh: true,
      ),
    );
    List<dynamic> list = response.data;
    return list.map((e) => NodeItem.fromJson(e)).toList();
  }
}