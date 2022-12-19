import 'package:flutter/material.dart';
import 'package:test_project_bets/models/sport_info.dart';
import 'package:test_project_bets/res/app_colors.dart';
import 'package:test_project_bets/res/app_text_style.dart';
import 'package:intl/intl.dart';

class SportCell extends StatelessWidget {
  final SportInfo cellData;

  SportCell({required this.cellData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 174.0,
      decoration: BoxDecoration(
          color: AppColors.cell_backround,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        children: [
          Container(
            height: 29.0,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
            decoration: BoxDecoration(
                color: AppColors.main_dark_backround,
                borderRadius: BorderRadius.all(Radius.circular(3))
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 7.0, bottom: 7.0),
                  child: Image.asset('assets/icon_league.png'),
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.only(left: 13.0),
                  child: Text(
                      cellData.league,
                      maxLines: 1,
                      style: AppTextStyle.regular14
                  ),
                )),
                Container(
                  width: 39.0,
                  margin: EdgeInsets.only(left: 4.0, right: 16.0),
                  child: Text(
                      _convertDateTime(cellData.dateEvent),
                      style: AppTextStyle.regular14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
                getGameStatusString(cellData.gameStatus),
                style: AppTextStyle.italic15.copyWith(
                    color: getGameStatusColor(cellData.gameStatus))),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.only(top: 4),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    height: double.infinity,
                    width: 2.0,
                    color: AppColors.light_gray,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            cellData.homeTeamName,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular18,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            cellData.awayTeamName,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular18,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                )
              ],
            ),
          )),
          Container(
            height: 26.0,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
            decoration: const BoxDecoration(
                color: AppColors.main_dark_backround,
                borderRadius: BorderRadius.all(Radius.circular(1))
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(cellData.homeTeamScore == '' ? '-' : cellData.homeTeamScore,
                        style: AppTextStyle.regular12.copyWith(
                            color: getGameStatusColor(cellData.gameStatus))),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                    child: Text(cellData.awayTeamScore == '' ? '-' : cellData.awayTeamScore,
                        style: AppTextStyle.regular12.copyWith(
                            color: getGameStatusColor(cellData.gameStatus))),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getGameStatusString(String gameStatus) {
    return gameStatus == 'NS'
        ? 'Not Started'
        : gameStatus == 'AP'
            ? 'Live'
            : 'Finished';
  }

  Color getGameStatusColor(String gameStatus) {
    return gameStatus == 'AP'
        ? AppColors.orange_text
        : AppColors.white_text_color;
  }

  String _convertDateTime(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
    String formatDate = DateFormat("dd.MM").format(tempDate);
    return formatDate;
  }
}
