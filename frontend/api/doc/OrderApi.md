# api_client.api.OrderApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**orderIdGet**](OrderApi.md#orderidget) | **GET** /Order/{id} | 
[**orderIdPaymentStatusGet**](OrderApi.md#orderidpaymentstatusget) | **GET** /Order/{id}/payment-status | 
[**orderPost**](OrderApi.md#orderpost) | **POST** /Order | 


# **orderIdGet**
> OrderResponse orderIdGet(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getOrderApi();
final int id = 56; // int | 

try {
    final response = api.orderIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrderApi->orderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **orderIdPaymentStatusGet**
> PaymentStatusResponse orderIdPaymentStatusGet(id, timeoutSeconds)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getOrderApi();
final int id = 56; // int | 
final int timeoutSeconds = 56; // int | 

try {
    final response = api.orderIdPaymentStatusGet(id, timeoutSeconds);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrderApi->orderIdPaymentStatusGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **timeoutSeconds** | **int**|  | [optional] [default to 30]

### Return type

[**PaymentStatusResponse**](PaymentStatusResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **orderPost**
> OrderResponse orderPost(createOrdersRequest)



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

[**OrderResponse**](OrderResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

