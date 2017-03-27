// Comments
let
  Source = Excel.CurrentWorkbook(){[Name="City"]}[Content],
  change_type = Table.TransformColumnTypes(
    Source,
    {
      {"Id", Int64.Type},
      {"Name", type text}
    }
  ),

  add_pop_m = Table.AddColumn(
    change_type,
    "Population(m)",
    (CityRow) =>
      Table.RowCount(
        Table.SelectRows(
          People,
          each
            [CityId] = CityRow[Id]))),

  add_pop_so = Table.AddColumn(
    add_pop_m,
    "Population(so)",
      each
        let Id=[Id]
        in Table.RowCount(
          Table.SelectRows(
            People,
            each
              [CityId] = Id))),

  #"add pop fm" = Table.AddColumn(
    add_pop_so,
    "Population(f)",
    each
      f_countif(People, "CityId",[Id]))

in
   addpopfm
