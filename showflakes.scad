nFlakes = 100;
nRows = floor(sqrt(nFlakes));
nLastColumns = nFlakes - (nRows*nRows);
echo(nLastColumns);
distance = 100;

for (iRow = [0:nRows]){
    nColumns = iRow==nRows?nLastColumns:nRows;
    
    echo(str("iRow:",iRow, " nRows:", nRows, " nColumns:", nColumns));
    
    for (iColumn = [0:nColumns-1]){
        i = iRow * nRows + iColumn;
        translate([iRow * distance, iColumn*distance, 0])
            import(str("/Users/bpijls/Desktop/snowflake/flake",i+1,".stl"));
    }
}