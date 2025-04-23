# api_client.api.OrderApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**orderPost**](OrderApi.md#orderpost) | **POST** /Order | 


# **orderPost**
> Order orderPost(createOrdersRequest)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getOrderApi();
final CreateOrdersRequest createOrdersRequest = ; // CreateOrdersRequest | 

try {
    final response = api.orderPost(createOrdersRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrderApi->orderPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOrdersRequest** | [**CreateOrdersRequest**](CreateOrdersRequest.md)|  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

