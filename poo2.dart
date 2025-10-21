import 'dart:io';

void main() {
  print('🛒 Bienvenido al carrito de compras');
  print('Ingresa los productos uno por uno.\n');

  List<Map<String, dynamic>> productos = [];
  double total = 0.0;
  int contador = 1;

  while (true) {
    print('--- Producto $contador ---');

    stdout.write('Código: ');
    String? codigo = stdin.readLineSync();

    stdout.write('Nombre: ');
    String? nombre = stdin.readLineSync();

    stdout.write('Precio: ');
    String? precioStr = stdin.readLineSync();
    double precio = double.tryParse(precioStr ?? '') ?? 0.0;

    stdout.write('Categoría: ');
    String? categoria = stdin.readLineSync();

    stdout.write('Cantidad: ');
    String? cantidadStr = stdin.readLineSync();
    int cantidad = int.tryParse(cantidadStr ?? '') ?? 0;

    // Mostrar el producto agregado
    print('\n✅ Producto agregado:');
    print('Código: $codigo');
    print('Nombre: $nombre');
    print('Precio: \$${precio.toStringAsFixed(2)}');
    print('Categoría: $categoria');
    print('Cantidad: $cantidad');
    print('');

    // Acumular total
    total += precio * cantidad;

    // Guardar (opcional, solo para referencia si se necesita después)
    productos.add({
      'codigo': codigo,
      'nombre': nombre,
      'precio': precio,
      'categoria': categoria,
      'cantidad': cantidad,
    });

    // Preguntar si desea agregar otro
    stdout.write('¿Deseas agregar otro producto? (s/n): ');
    String? respuesta = stdin.readLineSync()?.trim().toLowerCase();
    if (respuesta != 's' && respuesta != 'si') {
      break;
    }
    contador++;
  }

  // Imprimir total final
  print('===========================');
  print('TOTAL DE LA COMPRA: \$${total.toStringAsFixed(2)}');
}