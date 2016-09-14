[ nombre, ruta ] = uigetfile( '*.bmp', 'Abrir' );
imagen = imread( [ ruta, nombre ] );
figure;
imshow( imagen );
[ n, m ] = size( imagen );