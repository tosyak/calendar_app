import 'package:calendar_app/core/error/exceptions.dart';
import 'package:calendar_app/core/network/api_client.dart';
import 'package:calendar_app/core/network/api_endpoints.dart';
import 'package:calendar_app/data/models/event_list_model.dart';
import 'package:calendar_app/data/models/event_model.dart';
import 'package:dio/dio.dart';

class EventApi extends ApiClient {
  EventApi();

  Future<List<EventModel>> getEventsList({
    required String startDate,
    String? endDate,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.events,
        queryParameters: {'start_date': startDate, 'end_date': endDate},
      );
      if (response.statusCode == 200) {
        final eventsListModel = EventsListModel.fromJson(response.data);
        return eventsListModel.events;
      } else {
        throw ServerException('Failed to fetch products', response.statusCode);
      }
    } on DioException catch (e) {
      throw NetworkException(
        e.message ?? 'Network error',
        e.response?.statusCode,
      );
    }
  }
}
