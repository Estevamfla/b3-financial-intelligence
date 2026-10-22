
-- B3 FINANCIAL INTELLIGENCE
-- Consultas financeiras - SQLite
-- Base: CVM / DFP 2025

-- 1. Quantidade de empresas cadastradas
SELECT COUNT(*) AS total_empresas
FROM empresas;


-- 2. Dez empresas com maior receita
SELECT
    e.nome AS empresa,
    i.ano,
    i.receita,
    i.lucro_liquido,
    i.margem_liquida
FROM indicadores_financeiros i
JOIN empresas e
    ON e.cnpj = i.cnpj
WHERE i.ano = 2025
ORDER BY i.receita DESC
LIMIT 10;


-- 3. Empresas com margem líquida negativa
SELECT
    e.nome AS empresa,
    i.ano,
    i.receita,
    i.lucro_liquido,
    i.margem_liquida
FROM indicadores_financeiros i
JOIN empresas e
    ON e.cnpj = i.cnpj
WHERE i.ano = 2025
  AND i.margem_liquida < 0
ORDER BY i.margem_liquida ASC;


-- 4. Indicadores da Petrobras
SELECT
    e.nome AS empresa,
    i.ano,
    i.receita,
    i.lucro_bruto,
    i.lucro_liquido,
    i.margem_bruta,
    i.margem_liquida
FROM indicadores_financeiros i
JOIN empresas e
    ON e.cnpj = i.cnpj
WHERE e.cnpj = '33.000.167/0001-01'
  AND i.ano = 2025;
