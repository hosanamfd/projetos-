"""
Solução para a parte 1 do primeiro desafio do Advent of Code.
Primeiro, transformei os números dados em uma planilha CSV para facilitar a manipulação.
O código carrega essa planilha, ordena duas colunas de números e calcula a soma das
distâncias absolutas entre os pares correspondentes.
"""


from google.colab import files
import pandas as pd
uploaded = files.upload()

def carregar_dados(nome_arquivo):
  return pd.read_csv(nome_arquivo ,header =None)    #carregar o arquivo com os numeros dados  no desafio 

def ordenar_colunas(df):
  col1_ordenada = sorted(df[0])   # ordena cada coluna do mneor para o maior
  col2_ordenada = sorted(df[1])
  return  pd.DataFrame({
    'Coluna1': col1_ordenada,
    'Coluna2': col2_ordenada
})

def calcular_distancia(df):
  df['distancia']= abs(df['Coluna1']- df['Coluna2'])  #calula a distancia em módulo 
  return sum(df['distancia'])

if __name__ == "__main__":                  #executa as funções 
  df = carregar_dados('advent of code.csv')        
  df_ordenado = ordenar_colunas(df)
  total_distancia = calcular_distancia(df_ordenado)
  print(f'a distancia total é de: {total_distancia}')

""" 
a resposta é: 2285373
"""
