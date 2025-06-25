/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

velo_cat = 6;


//---Movimentação do jogador---

if (keyboard_check(ord("D")))
{
	if (x < room_width - 32) // Limite da direita
	{
		x += velo_cat;
	}
	else
	{
		x = room_width - 32; // Corrige se ultrapassar
	}
}

if (keyboard_check(ord("A")))
{
	if (x > 0) // Limite da esquerda
	{
		x -= velo_cat;
	}
	else
	{
		x = 0; // Corrige se ultrapassar
	}
}
//Checando posição Y

if (y >= 544)
{
	//Verificando se está no chão
	y = 544;
	force_jump = 0;
	if (keyboard_check_pressed(vk_space))
	{
		force_jump = force_jump - 18;
	}
}
else
{
	force_jump = force_jump + grav_game;
}

//Alterando eixo Y
y = y + force_jump;


