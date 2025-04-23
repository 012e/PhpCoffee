@Openapi(
  additionalProperties: DioProperties(
    pubName: 'petstore_api',
    pubAuthor: 'Johnny dep..',
  ),
  inputSpec: RemoteSpec(
    path: 'https://petstore3.swagger.io/api/v3/openapi.json',
  ),
  typeMappings: {'Pet': 'ExamplePet'},
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'api/petstore_api',
)
class Example {}
