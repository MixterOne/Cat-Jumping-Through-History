/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroi se sair da tela
if (x > room_width + 100 || y < -100 || y > room_height + 100) {
    instance_destroy();
}




