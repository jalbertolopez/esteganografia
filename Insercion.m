[ nombre, ruta ] = uigetfile( '*.bmp', 'Abrir' );
imagen = imread( [ ruta, nombre ] );
imshow( imagen );
[n,m] = size( imagen);
copiaImagen = imagen;
[ nombreTxt, rutaTxt ] = uigetfile( '*.txt', 'Abrir' );
texto = fopen( strcat( rutaTxt,nombreTxt ) );
caracteres8Bits = fread( texto, '*uint8' );
longuitud_texto = length( caracteres8Bits );
textoVector = [ ];
for i = 1:longuitud_texto
    textoVector = [ textoVector, bitget( caracteres8Bits(i), 8:-1:1 ) ];
end
textoVector = [ textoVector, bitget( uint8( 127 ), 8:-1:1 ) ];
fclose( texto );
longuitudTextoVector = size(textoVector);