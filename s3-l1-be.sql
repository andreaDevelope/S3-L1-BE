-- es1
SELECT COUNT(*) AS numero_fatture
FROM fatture
WHERE iva = 20;

-- es2
SELECT *
FROM prodotti
WHERE EXTRACT(YEAR FROM data_attivazione) = 2017
  AND (stato = 'in produzione' OR stato = 'in commercio');

-- es3
SELECT f.*, c.*
FROM fatture f
JOIN clienti c ON f.cliente_id = c.id
WHERE f.importo < 1000;

-- es4
SELECT f.numero, f.importo, f.iva, f.data, fo.nome AS fornitore
FROM fatture f
JOIN fornitori fo ON f.fornitore_id = fo.id;

-- es5
SELECT EXTRACT(YEAR FROM data) AS anno, COUNT(*) AS numero_fatture
FROM fatture
WHERE iva = 20
GROUP BY anno
ORDER BY anno;

-- es6
SELECT EXTRACT(YEAR FROM data) AS anno, COUNT(*) AS numero_fatture, SUM(importo) AS somma_importi
FROM fatture
GROUP BY anno
ORDER BY anno;

-- es7
SELECT EXTRACT(YEAR FROM data) AS anno
FROM fatture
WHERE tipologia = 'A'
GROUP BY anno
HAVING COUNT(*) > 2
ORDER BY anno;

-- es8
SELECT c.residenza, SUM(f.importo) AS totale_importi
FROM fatture f
JOIN clienti c ON f.cliente_id = c.id
GROUP BY c.residenza
ORDER BY totale_importi DESC;

-- es9
SELECT COUNT(DISTINCT c.id) AS numero_clienti
FROM clienti c
JOIN fatture f ON c.id = f.cliente_id
WHERE EXTRACT(YEAR FROM c.data_nascita) = 1980
  AND f.importo > 50;
