# api_client.api.IngredientApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ingredientGet**](IngredientApi.md#ingredientget) | **GET** /Ingredient | 
[**ingredientIdDelete**](IngredientApi.md#ingredientiddelete) | **DELETE** /Ingredient/{id} | 
[**ingredientIdGet**](IngredientApi.md#ingredientidget) | **GET** /Ingredient/{id} | 
[**ingredientIdImagePut**](IngredientApi.md#ingredientidimageput) | **PUT** /Ingredient/{id}/image | 
[**ingredientIdPatch**](IngredientApi.md#ingredientidpatch) | **PATCH** /Ingredient/{id} | 
[**ingredientPost**](IngredientApi.md#ingredientpost) | **POST** /Ingredient | 


# **ingredientGet**
> BuiltList<IngredientResponse> ingredientGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getIngredientApi();

try {
    final response = api.ingredientGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling IngredientApi->ingredientGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;IngredientResponse&gt;**](IngredientResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ingredientIdDelete**
> ingredientIdDelete(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getIngredientApi();
final int id = 56; // int | 

try {
    api.ingredientIdDelete(id);
} catch on DioException (e) {
    print('Exception when calling IngredientApi->ingredientIdDelete: $e\n');
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

# **ingredientIdGet**
> IngredientResponse ingredientIdGet(id)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getIngredientApi();
final int id = 56; // int | 

try {
    final response = api.ingredientIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IngredientApi->ingredientIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**IngredientResponse**](IngredientResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ingredientIdImagePut**
> ingredientIdImagePut(id, file)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getIngredientApi();
final int id = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    api.ingredientIdImagePut(id, file);
} catch on DioException (e) {
    print('Exception when calling IngredientApi->ingredientIdImagePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **file** | **MultipartFile**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ingredientIdPatch**
> IngredientResponse ingredientIdPatch(id, updateIngredientRequest)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getIngredientApi();
final int id = 56; // int | 
final UpdateIngredientRequest updateIngredientRequest = ; // UpdateIngredientRequest | 

try {
    final response = api.ingredientIdPatch(id, updateIngredientRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IngredientApi->ingredientIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **updateIngredientRequest** | [**UpdateIngredientRequest**](UpdateIngredientRequest.md)|  | [optional] 

### Return type

[**IngredientResponse**](IngredientResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ingredientPost**
> IngredientResponse ingredientPost(createIngredientRequest)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getIngredientApi();
final CreateIngredientRequest createIngredientRequest = ; // CreateIngredientRequest | 

try {
    final response = api.ingredientPost(createIngredientRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IngredientApi->ingredientPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createIngredientRequest** | [**CreateIngredientRequest**](CreateIngredientRequest.md)|  | [optional] 

### Return type

[**IngredientResponse**](IngredientResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

