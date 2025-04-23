# api_client.api.InventoryTransactionApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inventoryTransactionGet**](InventoryTransactionApi.md#inventorytransactionget) | **GET** /InventoryTransaction | 
[**inventoryTransactionIdDelete**](InventoryTransactionApi.md#inventorytransactioniddelete) | **DELETE** /InventoryTransaction/{id} | 
[**inventoryTransactionIdGet**](InventoryTransactionApi.md#inventorytransactionidget) | **GET** /InventoryTransaction/{id} | 
[**inventoryTransactionPost**](InventoryTransactionApi.md#inventorytransactionpost) | **POST** /InventoryTransaction | 


# **inventoryTransactionGet**
> BuiltList<InventoryTransactionResponse> inventoryTransactionGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getInventoryTransactionApi();

try {
    final response = api.inventoryTransactionGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InventoryTransactionApi->inventoryTransactionGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;InventoryTransactionResponse&gt;**](InventoryTransactionResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventoryTransactionIdDelete**
> inventoryTransactionIdDelete(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getInventoryTransactionApi();
final int id = 56; // int | 

try {
    api.inventoryTransactionIdDelete(id);
} catch on DioException (e) {
    print('Exception when calling InventoryTransactionApi->inventoryTransactionIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventoryTransactionIdGet**
> InventoryTransactionResponse inventoryTransactionIdGet(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getInventoryTransactionApi();
final int id = 56; // int | 

try {
    final response = api.inventoryTransactionIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InventoryTransactionApi->inventoryTransactionIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**InventoryTransactionResponse**](InventoryTransactionResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventoryTransactionPost**
> InventoryTransaction inventoryTransactionPost(createInventoryTransactionRequest)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getInventoryTransactionApi();
final CreateInventoryTransactionRequest createInventoryTransactionRequest = ; // CreateInventoryTransactionRequest | 

try {
    final response = api.inventoryTransactionPost(createInventoryTransactionRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InventoryTransactionApi->inventoryTransactionPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createInventoryTransactionRequest** | [**CreateInventoryTransactionRequest**](CreateInventoryTransactionRequest.md)|  | [optional] 

### Return type

[**InventoryTransaction**](InventoryTransaction.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

