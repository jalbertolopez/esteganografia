[ nombre, ruta ] = uigetfile( '*.bmp', 'Abrir' );
imagen = imread( [ ruta, nombre ] );
figure;
imshow( imagen );
[ n, m ] = size( imagen );
[ nombreTxt, rutaTxt ] = uigetfile( '*.txt', 'Abrir' );
texto = fopen( strcat( rutaTxt, nombreTxt ) );
caracteres8Bits = fread( texto, '*uint8' );
longuitudTexto = length( caracteres8Bits );
textoVector = [ ];

for fila = 1 : m
    for columna = 1 : n
        pixel = imagen( fila, columna );
        bitExtraido = bitget( pixel,1 );
        caracter8Bits = strcat( caracter8Bits, ...
										num2str( bitExtraido ) );
