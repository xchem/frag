
createdb emolecules && psql -c 'create extension rdkit' emolecules &&  psql -c 'create table raw_data (id SERIAL, smiles text, mol_id integer, parent_id integer)' emolecules &&  zcat smis.smi.gz | sed '1d; s/\\/\\\\/g' | psql -c "copy raw_data (smiles,mol_id,parent_id) from stdin with delimiter ' '" emolecules

