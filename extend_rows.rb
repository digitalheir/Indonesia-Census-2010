#  Copyright 2014 digitalheir
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# This script replaces all the null cells with their implicit value (the first non-null cell above it)
require 'csv'

table = CSV.read('population_indonesian_villages.psv', {:col_sep => '|'})

def get_vals(row, i_code, i_name, prev_code, prev_name)
  if row[i_code] or row[i_name]
    unless row[i_code] and row[i_name]
      puts "ERROR: #{rows}"
    end
    # puts "Changing to #{row[i_name]}"
    code = row[i_code]
    name = row[i_name]
  else
    code = nil
    name = nil
    row[i_code] = prev_code
    row[i_name] = prev_name
  end
  if row[i_code] or row[i_name]
    unless row[i_code] and row[i_name]
      puts "ERROR: #{rows}"
    end
  end
  return code, name
end

prev_province_code =nil
prev_province_name = nil
prev_muni_code = nil
prev_muni_name = nil
prev_district_code = nil
prev_district_name = nil
prev_village_code = nil
prev_village_name = nil
for i in 1..table.length-1 do
  row = table[i]

  unless (row[0] == nil or /[0-9]+/ =~ row[0]) and (row[2] == nil or /[0-9]+/ =~ row[2]) and (row[4] == nil or /[0-9]+/ =~ row[4]) and (row[6] == nil or /[0-9]+/ =~ row[6]) and (row[8] == nil or /[0-9]+/ =~ row[8])
    puts "ERROR: #{row}"
  end

  # Province
  code, name = get_vals(row, 0, 1, prev_province_code, prev_province_name)
  if code and name
    prev_province_code = code
    prev_province_name = name
  end

  # Municipality
  code, name = get_vals(row, 2, 3, prev_muni_code, prev_muni_name)
  if code and name
    prev_muni_code = code
    prev_muni_name = name
  end

  # District
  code, name = get_vals(row, 4, 5, prev_district_code, prev_district_name)
  if code and name
    prev_district_code = code
    prev_district_name = name
  end

  # Village
  code, name = get_vals(row, 6, 7, prev_village_code, prev_village_name)
  if code and name
    prev_village_code = code
    prev_village_name = name
  end

  row[9] = "INDONESIA #{prev_province_name} #{prev_muni_name} #{prev_district_name} #{prev_village_name}"
end

CSV.open('population_indonesian_villages_no_null_cells.csv', 'wb', {:col_sep => '|'}) do |psv|
  table.each do |row|
    psv << row
  end
end