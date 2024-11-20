#!/usr/bin/env bash

# ------------------------------- VARIÁVEIS ----------------------------------------- #
arquivo=""
padrao=""
arquivo_saida=""
debug=0

# Cores para saída
AZUL='\e[34m'
VERMELHO='\e[31m'
RESET='\e[0m'

# ------------------------------- FUNÇÕES ----------------------------------------- #

# Função para exibir a mensagem de ajuda
usage() {
    echo -e "${AZUL}Uso: $0 -f <arquivo> -p <padrão> [-o <arquivo_saida>] [-d] [-h]${RESET}"
    echo -e "${AZUL}   -f <arquivo>        Arquivo de log a ser analisado${RESET}"
    echo -e "${AZUL}   -p <padrão>         Padrão a ser buscado (ex: IP, data)${RESET}"
    echo -e "${AZUL}   -o <arquivo_saida>  (Opcional) Arquivo para salvar a saída${RESET}"
    echo -e "${AZUL}   -d                  Ativa o modo debug${RESET}"
    echo -e "${AZUL}   -h                  Exibe esta mensagem de ajuda${RESET}"
    exit 1
}

# ------------------------------- TESTES ----------------------------------------- #

# Tratamento dos parâmetros com shift
while [[ $# -gt 0 ]]; do
    case "$1" in
        -f)
            arquivo="$2"
            shift 2
            ;;
        -p)
            padrao="$2"
            shift 2
            ;;
        -o)
            arquivo_saida="$2"
            shift 2
            ;;
        -d)
            debug=1
            shift
            ;;
        -h)
            usage
            ;;
        *)
            echo -e "${VERMELHO}Opção desconhecida: $1${RESET}"
            usage
            ;;
    esac
done

# Ativando o modo debug se o usuário passou a opção -d
if [[ "$debug" -eq 1 ]]; then
    set -x
fi

# Verificação dos parâmetros obrigatórios
if [[ -z "$arquivo" || -z "$padrao" ]]; then
    echo -e "${VERMELHO}Erro: Os parâmetros -f e -p são obrigatórios.${RESET}"
    usage
fi

# Checando se o arquivo existe
if [[ ! -f "$arquivo" ]]; then
    echo -e "${VERMELHO}Erro: O arquivo '$arquivo' não existe.${RESET}"
    exit 1
fi

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# Extraindo o padrão do arquivo
resultado=$(grep "$padrao" "$arquivo")

# Verificando se algum resultado foi encontrado
if [[ -z "$resultado" ]]; then
    echo -e "${AZUL}Nenhum resultado encontrado para o padrão '$padrao'.${RESET}"
    exit 0
fi

# Exibindo ou salvando o resultado
if [[ -n "$arquivo_saida" ]]; then
    echo "$resultado" > "$arquivo_saida"
    echo -e "${AZUL}Resultado salvo em '$arquivo_saida'.${RESET}"
else
    echo -e "${AZUL}Resultado encontrado:${RESET}"
    echo "$resultado"
fi

# Desativando o modo debug se foi ativado
if [[ "$debug" -eq 1 ]]; then
    set +x
fi

