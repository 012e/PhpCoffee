# api_client.api.MenuItemApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**menuItemGet**](MenuItemApi.md#menuitemget) | **GET** /MenuItem | 
[**menuItemIdDelete**](MenuItemApi.md#menuitemiddelete) | **DELETE** /MenuItem/{id} | 
[**menuItemIdGet**](MenuItemApi.md#menuitemidget) | **GET** /MenuItem/{id} | 
[**menuItemPost**](MenuItemApi.md#menuitempost) | **POST** /MenuItem | 


# **menuItemGet**
> BuiltList<MenuItemResponse> menuItemGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getMenuItemApi();

try {
    final response = api.menuItemGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MenuItemApi->menuItemGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;MenuItemResponse&gt;**](MenuItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **menuItemIdDelete**
> menuItemIdDelete(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getMenuItemApi();
final int id = 56; // int | 

try {
    api.menuItemIdDelete(id);
} catch on DioException (e) {
    print('Exception when calling MenuItemApi->menuItemIdDelete: $e\n');
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

# **menuItemIdGet**
> MenuItemResponse menuItemIdGet(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getMenuItemApi();
final int id = 56; // int | 

try {
    final response = api.menuItemIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MenuItemApi->menuItemIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**MenuItemResponse**](MenuItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **menuItemPost**
> MenuItemResponse menuItemPost(createMenuItemRequest)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getMenuItemApi();
final CreateMenuItemRequest createMenuItemRequest = ; // CreateMenuItemRequest | 

try {
    final response = api.menuItemPost(createMenuItemRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MenuItemApi->menuItemPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMenuItemRequest** | [**CreateMenuItemRequest**](CreateMenuItemRequest.md)|  | [optional] 

### Return type

[**MenuItemResponse**](MenuItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

