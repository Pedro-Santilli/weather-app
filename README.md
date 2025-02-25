# Weather App

Weather App é um aplicativo de previsão do tempo desenvolvido em Swift para iOS. O aplicativo exibe informações meteorológicas atuais, previsão horária e previsão para os próximos dias.

## Funcionalidades

- Exibir a temperatura atual, umidade e velocidade do vento
- Exibir ícone representando as condições climáticas atuais
- Exibir previsão horária
- Exibir previsão para os próximos dias
- Atualizar automaticamente os dados meteorológicos

## Estrutura do Projeto

- `ViewController.swift`: Controlador principal que gerencia a exibição das informações meteorológicas e a interação do usuário.
- `HourlyForecastCollectionViewCell.swift`: Célula personalizada para exibir a previsão horária.
- `DailyForecastTableViewCell.swift`: Célula personalizada para exibir a previsão diária.
- `Service.swift`: Classe responsável por buscar os dados meteorológicos da API.
- `Models/`: Contém os modelos de dados para a previsão do tempo.

## Como Executar

1. Certifique-se de ter o Xcode instalado em sua máquina. Para mais informações, consulte a [documentação do Xcode](https://developer.apple.com/xcode/).

2. Clone este repositório:

   ```sh
   git clone <URL_DO_REPOSITORIO>
3. Abra o projeto no Xcode:
   ```sh
   open WeatherApp.xcodeproj
4.  Selecione o dispositivo ou simulador desejado e execute o aplicativo:
     ```sh
    Cmd + R
## Uso
O aplicativo exibirá a temperatura atual, umidade e velocidade do vento para a cidade configurada.
A previsão horária será exibida em um UICollectionView horizontal.
A previsão para os próximos dias será exibida em um UITableView vertical.
Os dados serão atualizados automaticamente ao abrir o aplicativo.
