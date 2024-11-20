# Leitor de Logs - leitorLog.sh

## Descrição
`leitorLog.sh` é um script Bash que permite realizar a leitura de arquivos de log, buscar padrões específicos e salvar os resultados em um arquivo de saída opcional.

## Funcionalidades
- Busca de padrões definidos pelo usuário em arquivos de log.
- Salvamento dos resultados da busca em um arquivo especificado.
- Exemplo de uso:

```bash
./leitorLog.sh -f syslog.log -p "ERROR" -o resultado.txt
```
No exemplo acima, o script busca por ocorrências do padrão "ERROR" no arquivo `syslog.log` e salva os resultados no arquivo `resultado.txt`.

## Parâmetros
- `-f <arquivo>`: Especifica o arquivo de log a ser analisado.
- `-p <padrão>`: Define o padrão que será buscado no arquivo de log.
- `-o <arquivo>` (opcional): Arquivo onde os resultados da busca serão salvos.

## Como executar
1. Certifique-se de ter permissões de execução no script:
   ```bash
   chmod +x leitorLog.sh
   ```
2. Execute o script com os parâmetros desejados:
   ```bash
   ./leitorLog.sh -f <arquivo_de_log> -p <padrão> [-o <arquivo_de_saida>]
   ```

## Autor
- **Leonardo N.D.**
- Este script foi criado e é mantido por Leonardo N.D.

## Histórico de versões
- **v1.0** - 11/11/2024: Início do programa e implementação das funcionalidades principais.
- **v1.1** - 11/11/2024: Adicionada a função de debug com a opção -d.
- **v1.2** - 11/11/2024: Adicionadas variáveis para cores (azul e vermelho) para mensagens.

## Licença
Este script é de uso livre. Sinta-se à vontade para modificar e distribuir.
