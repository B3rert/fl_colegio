import 'package:fl_colegio/theme/app_theme.dart';
import 'package:fl_colegio/view_models/login_view_model.dart';
import 'package:fl_colegio/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  _CardOptions(
                    icon: Icons.assured_workload,
                    iconColor: Colors.red,
                    title: "Estado de cuenta",
                    subtitle: "Historial, Pagos",
                  ),
                  _CardOptions(
                      icon: Icons.assignment_add,
                      iconColor: Colors.purple,
                      title: "Inscripciones",
                      subtitle: "Nuevo ciclo escolar"),
                ],
              ),
              const Row(
                children: [
                  _CardOptions(
                    icon: Icons.description,
                    iconColor: Colors.green,
                    title: "Notas",
                    subtitle: "Calficaciones por cursos",
                  ),
                  _CardOptions(
                    icon: Icons.book,
                    iconColor: Colors.pink,
                    title: "Cursos",
                    subtitle: "Cursos asignados",
                  ),
                ],
              ),
              Row(
                children: [
                  const _CardOptions(
                    icon: Icons.calendar_month,
                    iconColor: Colors.blue,
                    title: "Horarios",
                    subtitle: "Cursos asignados",
                  ),
                  _CardOptions(
                    icon: Icons.person,
                    iconColor: Colors.orange,
                    title: "Perfil",
                    subtitle:
                        Provider.of<LoginViewModel>(context, listen: false)
                                .usuario
                                ?.usuario ??
                            "Usuario",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardOptions extends StatelessWidget {
  const _CardOptions({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    var titleStyle = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    var textStyle = const TextStyle(
      color: AppTheme.secondaryColorDark,
    );
    return Expanded(
      child: Cardwidget(
        borderRadius: 20,
        width: double.infinity,
        height: 150,
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 35,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: titleStyle,
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
