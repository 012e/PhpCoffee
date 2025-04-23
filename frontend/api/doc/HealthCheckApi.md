# api_client.api.HealthCheckApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthCheckAuthorizedGet**](HealthCheckApi.md#healthcheckauthorizedget) | **GET** /HealthCheck/Authorized | 
[**healthCheckCurrentUserGet**](HealthCheckApi.md#healthcheckcurrentuserget) | **GET** /HealthCheck/CurrentUser | 
[**healthCheckThrowExceptionGet**](HealthCheckApi.md#healthcheckthrowexceptionget) | **GET** /HealthCheck/ThrowException | 


# **healthCheckAuthorizedGet**
> String healthCheckAuthorizedGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getHealthCheckApi();

try {
    final response = api.healthCheckAuthorizedGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling HealthCheckApi->healthCheckAuthorizedGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **healthCheckCurrentUserGet**
> ProblemDetails healthCheckCurrentUserGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getHealthCheckApi();

try {
    final response = api.healthCheckCurrentUserGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling HealthCheckApi->healthCheckCurrentUserGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProblemDetails**](ProblemDetails.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **healthCheckThrowExceptionGet**
> String healthCheckThrowExceptionGet()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getHealthCheckApi();

try {
    final response = api.healthCheckThrowExceptionGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling HealthCheckApi->healthCheckThrowExceptionGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

