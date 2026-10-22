
from pathlib import Path
import requests

URL_BASE = "https://dados.cvm.gov.br/dados/CIA_ABERTA/DOC/DFP/DADOS/"
ANOS = [2023, 2024, 2025]

PASTA = Path("dados/brutos")
PASTA.mkdir(parents=True, exist_ok=True)

for ano in ANOS:
    nome = f"dfp_cia_aberta_{ano}.zip"
    url = URL_BASE + nome
    destino = PASTA / nome

    print(f"Baixando dados de {ano}...")

    try:
        resposta = requests.get(url, timeout=120)
        resposta.raise_for_status()
        destino.write_bytes(resposta.content)

        print(f"Salvo: {destino}")

    except requests.RequestException as erro:
        print(f"Erro no ano {ano}: {erro}")

print("Processo finalizado.")
