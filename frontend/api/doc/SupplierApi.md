# api_client.api.SupplierApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supplierGet**](SupplierApi.md#supplierget) | **GET** /Supplier | 
[**supplierIdDelete**](SupplierApi.md#supplieriddelete) | **DELETE** /Supplier/{id} | 
[**supplierIdGet**](SupplierApi.md#supplieridget) | **GET** /Supplier/{id} | 
[**supplierPost**](SupplierApi.md#supplierpost) | **POST** /Supplier | 


# **supplierGet**
> BuiltList<SupplierResponse> supplierGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSupplierApi();

try {
    final response = api.supplierGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->supplierGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SupplierResponse&gt;**](SupplierResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supplierIdDelete**
> supplierIdDelete(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSupplierApi();
final int id = 56; // int | 

try {
    api.supplierIdDelete(id);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->supplierIdDelete: $e\n');
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
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supplierIdGet**
> SupplierResponse supplierIdGet(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSupplierApi();
final int id = 56; // int | 

try {
    final response = api.supplierIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->supplierIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**SupplierResponse**](SupplierResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supplierPost**
> SupplierResponse supplierPost(createSupplierRequest)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSupplierApi();
final CreateSupplierRequest createSupplierRequest = ; // CreateSupplierRequest | 

try {
    final response = api.supplierPost(createSupplierRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->supplierPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createSupplierRequest** | [**CreateSupplierRequest**](CreateSupplierRequest.md)|  | [optional] 

### Return type

[**SupplierResponse**](SupplierResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

