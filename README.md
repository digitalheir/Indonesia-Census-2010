Indonesian census 2010
======================
This repository contains code to make structured, machine-readable data out of the tables in the [PDF file](http://bps.go.id/eng/download_file/Population_of_Indonesia_by_Village_2010.pdf) of the 2010 Indonesian census. The table contains a column with all location information concatenated (country + province + municipality + district + village), to facilitate geocoding. Aditionally, I have changed the name "GUN0NG KAPHO" (with the number 0) to "GUNONG KAPHO"  (with the letter 'O').

NOTE: The output file is a .csv file, but we use the pipe (|) as a separator.

Check out the [fusion table](https://www.google.com/fusiontables/DataSource?docid=1OlmGuziakXDKU7EB-By-xUZH_2YiQdTGP5HWMohG) based on `population_indonesian_villages_no_null_cells.csv`.

More information 
================
Wikipedia: https://en.wikipedia.org/wiki/Indonesian_2010_census
Statistics Indonesia: http://www.bps.go.id/eng/menutab.php?tabel=1&kat=1&id_subyek=12