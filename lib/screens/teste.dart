import 'package:flutter/material.dart';

class ListaTransferencias extends StatelessWidget {
  @override
  final	List<Transferencia>	_transferencias	=	List();

  Widget	build(BuildContext	context)	{
    _transferencias.add(Transferencia(100.0,	1000));
    _transferencias.add(Transferencia(100.0,	1000));
    _transferencias.add(Transferencia(100.0,	1000));
    _transferencias.add(Transferencia(100.0,	1000));
    return	Scaffold(
      appBar:	AppBar(
        title:	Text('Transferências'),
      ),
      body: ListView.builder(itemBuilder: null),


      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), 	onPressed:()
      {
        final	Future<Transferencia>	future	= Navigator.push(context,	MaterialPageRoute(builder:	(context)	{
          return	FormularioTransferencia();
        }));
        future.then((transferenciaRecebida)	{
          debugPrint('chegou	no	then	do	future');
          debugPrint('$transferenciaRecebida');
          _transferencias.add(transferenciaRecebida);
        });
      }

      ),
    );
  }
}