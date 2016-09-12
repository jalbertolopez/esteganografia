[ nombre, ruta ] = uigetfile( '*.bmp', 'Abrir' );
imagen = imread( [ ruta, nombre ] );
imshow( imagen );
[n,m] = size( imagen);
copiaImagen = imagen;
[ nombreTxt, rutaTxt ] = uigetfile( '*.txt', 'Abrir' );
texto = fopen( strcat( rutaTxt,nombreTxt ) );
caracteres8Bits = fread( texto, '*uint8' );
longuitudTexto = length( caracteres8Bits );
textoVector = [ ];
for i = 1:longuitudTexto
    textoVector = [ textoVector, bitget( caracteres8Bits(i), 8:-1:1 ) ];
end
textoVector = [ textoVector, bitget( uint8( 127 ), 8:-1:1 ) ];
fclose( texto );
longuitudTextoVector = size( textoVector );
if longuitudTextoVector <= ( ( m * n ) / 8 )
    bit = 1;
    for fila = 1:m
        for columna = 1:n
            pixel = imagen( fila, columna );
            copiaImagen( fila, columna ) = ...
								bitset( pixel, 1, textoVector( bit ) );
            bit = bit + 1;
            if bit > longuitudTextoVector
                break;
            end
        end
        if bit > longuitudTextoVector
            break;
        end
    end
    imwrite( copiaImagen, 'ImagenConTexto','bmp' );
    figure;
    imshow( copiaImagen );
end