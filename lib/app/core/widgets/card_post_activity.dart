import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class CardPostActivity extends StatelessWidget {
  final String destination;
  final String date;
  final String state;
  final String amount;
  final void Function()? ontapForDetail;
  final void Function()? ontapForModified;
  final void Function()? ontapForDeleted;
  const CardPostActivity(
      {super.key,
      required this.destination,
      required this.date,
      required this.state,
      required this.amount,
      this.ontapForDetail,
      this.ontapForModified,
      this.ontapForDeleted});

  @override
  Widget build(BuildContext context) {
    // Définir la couleur du texte en fonction de l'état
    Color getStateColor() {
      switch (state) {
        case "En cours":
          return Colors.green;
        case "En attente":
          return Colors.blue;
        case "Terminé":
          return AppColors.primaryColor;
        default:
          return AppColors.textColor;
      }
    }

    // Définir si le bouton d'édition doit être affiché
    bool showEditButton() {
      return state != "En cours" && state != "Terminé";
    }

    return Container(
      height: 10.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.darkColor,
            child: Icon(
              Icons.bus_alert,
              size: 15.0.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  destination,
                  style: Apptheme.ligthTheme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.textColor),
                ),
                Text(
                  date,
                  style: Apptheme.ligthTheme.textTheme.bodySmall,
                ),
                Text(
                  state,
                  style: Apptheme.ligthTheme.textTheme.bodySmall!.copyWith(
                      color:
                          getStateColor()), // Changer la couleur selon l'état
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$amount\$",
                  style: Apptheme.ligthTheme.textTheme.titleMedium!
                      .copyWith(color: AppColors.textSecondaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: ontapForDetail,
                      child: Container(
                        margin: EdgeInsets.only(right: 1.5.wp),
                        padding: EdgeInsets.symmetric(
                            vertical: 0.8.hp, horizontal: 2.5.wp),
                        decoration: BoxDecoration(
                            color: AppColors.tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Détails',
                          style: Apptheme.ligthTheme.textTheme.titleSmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                    // Afficher le bouton d'édition seulement si l'état n'est pas "en cours" ou "terminé"
                    if (showEditButton())
                      GestureDetector(
                        onTap: ontapForModified,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.8.hp, horizontal: 2.0.wp),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.edit,
                              size: 12.0.sp, color: AppColors.white),
                        ),
                      ),
                    GestureDetector(
                      onTap: ontapForDeleted,
                      child: Container(
                        margin: EdgeInsets.only(left: 1.5.wp),
                        padding: EdgeInsets.symmetric(
                            vertical: 0.8.hp, horizontal: 2.0.wp),
                        decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.delete,
                            size: 12.0.sp, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
