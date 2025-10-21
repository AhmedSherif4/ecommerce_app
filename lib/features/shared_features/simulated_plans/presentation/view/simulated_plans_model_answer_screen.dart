part of '../../simulated_plans.dart';

class SimulatedAnswerData extends Equatable{
  final SimulatedExamResults simulatedExamResults;
  final String piece;

  const SimulatedAnswerData({
    required this.simulatedExamResults,
    required this.piece,
  });

  @override
  List<Object?> get props => [simulatedExamResults, piece];
}

class SimulatedAnswerBuild extends StatefulWidget {
  final SimulatedAnswerData simulatedExamResult;

  const SimulatedAnswerBuild({
    super.key, required this.simulatedExamResult,
  });

  @override
  State<SimulatedAnswerBuild> createState() => SimulatedAnswerBuildState();
}

class SimulatedAnswerBuildState extends State<SimulatedAnswerBuild> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController =
  ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {

    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           width: double.infinity,
    //           height: AppReference.deviceHeight(context) *
    //               0.06.responsiveHeightRatio,
    //           child: LayoutBuilder(builder: (context, constrains) {
    //             return Row(
    //               children: [
    //                 SvgPicture.asset(
    //                   AppImagesAssets.sLogoWithoutName,
    //                   width: constrains.maxWidth * 0.2,
    //                   height: constrains.maxHeight * 0.7,
    //                   fit: BoxFit.cover,
    //                 ),
    //                 AppSize.s10.sizedBoxWidth,
    //                 TextWithBackGroundColor(
    //                   backgroundColor:
    //                   AppColors.primaryColorBlue.withOpacity(.1),
    //                   text: "ملخص الاختبار",
    //                   width: constrains.maxWidth * 0.6,
    //                   height: constrains.maxHeight * 0.7,
    //                   verticalPadding: 0,
    //                   textColor: AppColors.textColor4,
    //                 ),
    //                 const Spacer(),
    //                 TextButtonWidget(
    //                   text: "حسنا!",
    //                   textColor: AppColors.primaryColorOrange,
    //                   fontSize: AppReference.deviceIsTablet?AppFontSize.sp16:AppFontSize.sp14,
    //                   onPressed: () {
    //                     RouteManager.rPopRoute(context);
    //                   },
    //                 ),
    //               ],
    //             );
    //           }),
    //         ).paddingBody(),
    //         Container(
    //           padding: EdgeInsets.symmetric(
    //               horizontal: AppPadding.p10.responsiveSize, vertical: AppPadding.p10.responsiveSize),
    //           margin: EdgeInsets.symmetric(
    //               horizontal: AppPadding.p10.responsiveSize,),
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR25.responsiveSize),
    //               color: AppColors.white
    //           ),
    //           child: Row(
    //               children: [
    //                 SvgPicture.asset(
    //                   AppIconsAssets.sNafeesResult,
    //                 ),
    //                 AppSize.s10.sizedBoxWidth,
    //                 Text(
    //                   "نتيجتك هي",
    //                   style: const AppTextStyle().w500.bodyLarge16,
    //                 ),
    //                 AppSize.s10.sizedBoxWidth,
    //                 Text(
    //                   "${widget.simulatedExamResult.simulatedExamResults.trueAnswersCount}/${widget.simulatedExamResult.simulatedExamResults.trueAnswersCount+widget.simulatedExamResult.simulatedExamResults.falseAnswersCount}",
    //                   style: const AppTextStyle().w500.bodyMedium14,
    //                 ),
    //               ]
    //           ),
    //
    //         ),
    //         AppSize.s20.sizedBoxHeight,
    //         Expanded(
    //           child: BlocBuilder<SimulatedBloc, SimulatedState>(
    //             builder: (context, state) {
    //               switch (state.getSimulatedModelAnswersState) {
    //                 case RequestStates.loaded:
    //                   return state.simulatedModelAnswers.answers!.isEmpty
    //                       ? Center(
    //                     child: Text(
    //                       'لم تقم بحل هذا الاختبار بعد',
    //                       style: AppTextStyle.titleSmall18,
    //                     ),
    //                   )
    //                       : Column(
    //                     children: [
    //                       SizedBox(
    //                         height: AppReference.deviceHeight(context) *
    //                             0.05.responsiveHeightRatio,
    //                         width: AppReference.deviceWidth(context),
    //                         child: ListView.separated(
    //                           controller: _scrollController,
    //                           scrollDirection: Axis.horizontal,
    //                           shrinkWrap: true,
    //                           itemBuilder: (listViewContext, cIndex) {
    //                             return CustomInkWell(
    //                               onTap: () {
    //
    //                                 _pageController.animateToPage(
    //                                   cIndex,
    //                                   duration: const Duration(
    //                                       milliseconds: 500),
    //                                   curve: Curves.easeInOut,
    //                                 );
    //                               },
    //                               child: CircleAvatar(
    //                                 radius:cIndex ==
    //                                     context
    //                                         .read<SimulatedBloc>()
    //                                         .pageIndex
    //                                     ? 20.responsiveSize
    //                                     : 15.responsiveSize,
    //                                 backgroundColor: state
    //                                     .simulatedModelAnswers
    //                                     .answers![cIndex]
    //                                     .isTrue ==
    //                                     "1"
    //                                     ? AppColors.successColor
    //                                     : AppColors.failColor,
    //                                 child: Text(
    //                                   '${cIndex + 1}',
    //                                   style: const AppTextStyle()
    //                                       .w700
    //                                       .bodyMedium14
    //                                       .copyWith(
    //                                       color: AppColors.white),
    //                                 ),
    //                               ),
    //                             );
    //                           },
    //                           separatorBuilder:
    //                               (listViewContext, index) =>
    //                           AppSize.s6.sizedBoxWidth,
    //                           itemCount: state
    //                               .simulatedModelAnswers.answers!.length,
    //                         ),
    //                       ).paddingBody(),
    //                       Expanded(
    //                         child: PageView.builder(
    //                           itemCount: state
    //                               .simulatedModelAnswers.answers!.length,
    //                           physics: const BouncingScrollPhysics(),
    //                           scrollDirection: Axis.horizontal,
    //                           controller: _pageController,
    //                           onPageChanged: (pageViewIndex) {
    //                             setState(() {
    //                               context.read<SimulatedBloc>().pageIndex =
    //                                   pageViewIndex;
    //                             });
    //                           },
    //                           itemBuilder:
    //                               (pageViewContext, pageViewIndex) {
    //                             return Column(
    //                                 crossAxisAlignment:
    //                                 CrossAxisAlignment.start,
    //                                 children: [
    //                                   Expanded(
    //                                     child: ListView(children: [
    //                                       Row(
    //                                         children: [
    //                                           CircleAvatar(
    //                                             backgroundColor: AppColors
    //                                                 .secondaryColor,
    //                                             child: Text(
    //                                                 AppReference.detectStringType(state
    //                                                     .simulatedModelAnswers
    //                                                     .answers![
    //                                                 pageViewIndex]
    //                                                     .simulatedQuestionEntity
    //                                                     .name) ==
    //                                                     StringType
    //                                                         .english
    //                                                     ? '${pageViewIndex + 1}'
    //                                                     : NumberFormat(
    //                                                     '#.##',
    //                                                     'ar_EG')
    //                                                     .format(
    //                                                     pageViewIndex +
    //                                                         1),
    //                                                 style:
    //                                                 const AppTextStyle()
    //                                                     .w600
    //                                                     .white
    //                                                     .bodyMedium14),
    //                                           ),
    //                                           AppSize.s10.sizedBoxWidth,
    //                                           QuestionsText(
    //                                             currentQuestion: state
    //                                                 .simulatedModelAnswers
    //                                                 .answers![
    //                                             pageViewIndex]
    //                                                 .simulatedQuestionEntity,
    //                                           ),
    //                                         ],
    //                                       ).paddingBody(),
    //
    //                                       if (state
    //                                           .simulatedModelAnswers
    //                                           .answers![pageViewIndex]
    //                                           .simulatedQuestionEntity
    //                                           .img !=
    //                                           null) ...[
    //                                         QuestionItemForSimulated(
    //                                             currentQuestion: state.simulatedModelAnswers.answers![pageViewIndex].simulatedQuestionEntity),
    //                                       ],
    //                                       CustomInkWell(
    //                                         onTap: () {
    //                                           showHintOfQuestionsDialog(
    //                                             context: context,
    //                                             descriptionText: state
    //                                                 .simulatedModelAnswers
    //                                                 .answers![
    //                                             pageViewIndex]
    //                                                 .simulatedQuestionEntity
    //                                                 .description,
    //                                           );
    //                                         },
    //                                         child: Row(
    //                                           mainAxisSize:
    //                                           MainAxisSize.min,
    //                                           mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                           children: [
    //                                             SvgPicture.asset(
    //                                               AppIconsAssets
    //                                                   .sAdultHint,
    //                                               width:
    //                                               25.responsiveSize,
    //                                               height:
    //                                               25.responsiveSize,
    //                                             ),
    //                                             AppSize.s10.sizedBoxWidth,
    //                                             Text(
    //                                               AppStrings.hint,
    //                                               style:
    //                                               const AppTextStyle()
    //                                                   .w700
    //                                                   .bodyMedium14
    //                                                   .copyWith(
    //                                                 fontFamily:
    //                                                 'NewFont',
    //                                               ),
    //                                             ),
    //                                             const Spacer(),
    //                                             if (state
    //                                                 .simulatedModelAnswers
    //                                                 .answers![
    //                                             pageViewIndex]
    //                                                 .simulatedQuestionEntity
    //                                                 .usePiece)
    //                                               CustomInkWell(
    //                                                 onTap: () {
    //                                                   showDialog(
    //                                                       context:
    //                                                       context,
    //                                                       builder:
    //                                                           (dialogContext) =>
    //                                                           SimulatedPieceDialog(
    //                                                             piece: widget
    //                                                                 .simulatedExamResult
    //                                                                 .piece,
    //                                                           ));
    //                                                 },
    //                                                 child: Row(
    //                                                   children: [
    //                                                     SvgPicture.asset(
    //                                                         AppIconsAssets
    //                                                             .sNafeesPieceText),
    //                                                     AppSize.s10
    //                                                         .sizedBoxWidth,
    //                                                     Text(
    //                                                       "انظر القطعة",
    //                                                       style: const AppTextStyle().w600.bodySmall12.copyWith(
    //                                                           color: AppColors
    //                                                               .primaryColorOrange,
    //                                                           decoration:
    //                                                           TextDecoration
    //                                                               .underline,
    //                                                           decorationColor:
    //                                                           AppColors
    //                                                               .primaryColorOrange),
    //                                                     )
    //                                                   ],
    //                                                 ).paddingBody(),
    //                                               )
    //                                           ],
    //                                         ),
    //                                       ).paddingBody(),
    //
    //                                       // Row(
    //                                       //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                       //     children: [
    //                                       //       // HintWidgetForNafees(currentQuestion: state.simulatedModelAnswers.answers![index].simulatedQuestionEntity,),
    //                                       //      const Spacer(),
    //                                       //       Text(
    //                                       //         "1/1",
    //                                       //         style: AppTextStyle().w500.bodyLarge16,
    //                                       //       ),
    //                                       //       AppSize.s10.sizedBoxWidth,
    //                                       //       Text(
    //                                       //         "درجة",
    //                                       //         style: AppTextStyle().w500.bodyMedium14,
    //                                       //       )
    //                                       //     ]
    //                                       // ),
    //                                       ListView.separated(
    //                                         physics:
    //                                         const NeverScrollableScrollPhysics(),
    //                                         shrinkWrap: true,
    //                                         itemBuilder: (answerContext,
    //                                             answerIndex) {
    //                                           return Container(
    //                                             width: AppReference
    //                                                 .deviceWidth(
    //                                                 context) *
    //                                                 0.9,
    //                                             padding: EdgeInsets.all(
    //                                                 10.responsiveSize),
    //                                             decoration: BoxDecoration(
    //                                               borderRadius: BorderRadius
    //                                                   .circular(10
    //                                                   .responsiveSize),
    //                                               color: (state
    //                                                   .simulatedModelAnswers
    //                                                   .answers![
    //                                               pageViewIndex]
    //                                                   .optionId ==
    //                                                   state
    //                                                       .simulatedModelAnswers
    //                                                       .answers![
    //                                                   pageViewIndex]
    //                                                       .simulatedQuestionEntity
    //                                                       .answers[
    //                                                   answerIndex]
    //                                                       .id) &&
    //                                                   state
    //                                                       .simulatedModelAnswers
    //                                                       .answers![
    //                                                   pageViewIndex]
    //                                                       .isTrue ==
    //                                                       "0"
    //                                                   ? AppColors
    //                                                   .failColor
    //                                                   : state
    //                                                   .simulatedModelAnswers
    //                                                   .answers![
    //                                               pageViewIndex]
    //                                                   .simulatedQuestionEntity
    //                                                   .answers[
    //                                               answerIndex]
    //                                                   .isTrue ==
    //                                                   "1"
    //                                                   ? AppColors
    //                                                   .successColor
    //                                                   : AppColors
    //                                                   .textColor6,
    //                                             ),
    //                                             child: Row(
    //                                               children: [
    //                                                 CircleAvatar(
    //                                                   backgroundColor:
    //                                                   AppColors.white,
    //                                                   child: Text(
    //                                                       AppReference.detectStringType(state
    //                                                           .simulatedModelAnswers
    //                                                           .answers![
    //                                                       pageViewIndex]
    //                                                           .simulatedQuestionEntity
    //                                                           .name) ==
    //                                                           StringType
    //                                                               .english
    //                                                           ? '${answerIndex + 1}'
    //                                                           : NumberFormat(
    //                                                           '#.##',
    //                                                           'ar_EG')
    //                                                           .format(
    //                                                           answerIndex +
    //                                                               1),
    //                                                       style: const AppTextStyle()
    //                                                           .w600
    //                                                           .bodyMedium14),
    //                                                 ),
    //                                                 AppSize.s10
    //                                                     .sizedBoxWidth,
    //                                                 Expanded(
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       state
    //                                                           .simulatedModelAnswers
    //                                                           .answers![
    //                                                       pageViewIndex]
    //                                                           .simulatedQuestionEntity
    //                                                           .answers[
    //                                                       answerIndex]
    //                                                           .option ??
    //                                                           "",
    //                                                       overflow:
    //                                                       TextOverflow
    //                                                           .ellipsis,
    //                                                       style: const AppTextStyle()
    //                                                           .s12
    //                                                           .w700
    //                                                           .bodyMedium14
    //                                                           .copyWith(
    //                                                         color: (state.simulatedModelAnswers.answers![pageViewIndex].optionId == state.simulatedModelAnswers.answers![pageViewIndex].simulatedQuestionEntity.answers[answerIndex].id) &&
    //                                                             state.simulatedModelAnswers.answers![pageViewIndex].isTrue ==
    //                                                                 "0"
    //                                                             ? AppColors
    //                                                             .white
    //                                                             : state.simulatedModelAnswers.answers![pageViewIndex].simulatedQuestionEntity.answers[answerIndex].isTrue == "1"
    //                                                             ? AppColors.white
    //                                                             : AppColors.black,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           );
    //                                         },
    //                                         separatorBuilder:
    //                                             (answerContext,
    //                                             answerIndex) =>
    //                                         AppSize.s10
    //                                             .sizedBoxHeight,
    //                                         itemCount: state
    //                                             .simulatedModelAnswers
    //                                             .answers![pageViewIndex]
    //                                             .simulatedQuestionEntity
    //                                             .answers
    //                                             .length,
    //                                       ).paddingBody(top: 0),
    //                                     ]),
    //                                   ),
    //                                   SizedBox(
    //                                     height: AppReference.deviceHeight(
    //                                         context) *
    //                                         0.09,
    //                                     child: Padding(
    //                                       padding: EdgeInsets.all(
    //                                           5.responsiveSize),
    //                                       child: Row(children: [
    //                                         Expanded(
    //                                             flex: 2,
    //                                             child:
    //                                             DefaultButtonWidget(
    //                                               label:
    //                                               AppStrings.previous,
    //                                               buttonColor: AppColors
    //                                                   .primaryColorBlue,
    //                                               onPressed: () {
    //                                                 if (pageViewIndex >
    //                                                     0) {
    //                                                   setState(() {
    //                                                     pageViewIndex--;
    //                                                   });
    //                                                   _pageController
    //                                                       .animateToPage(
    //                                                     pageViewIndex,
    //                                                     duration:
    //                                                     const Duration(
    //                                                         milliseconds:
    //                                                         500),
    //                                                     curve: Curves
    //                                                         .easeInOut,
    //                                                   );
    //                                                 }
    //                                               },
    //                                             )),
    //                                         AppSize.s10.sizedBoxWidth,
    //                                         Expanded(
    //                                             flex: 5,
    //                                             child:
    //                                             DefaultButtonWidget(
    //                                               label: state
    //                                                   .simulatedModelAnswers
    //                                                   .answers!
    //                                                   .last ==
    //                                                   state.simulatedModelAnswers
    //                                                       .answers![
    //                                                   pageViewIndex]
    //                                                   ? AppStrings.exist
    //                                                   : AppStrings.next,
    //                                               onPressed: () {
    //                                                 if (pageViewIndex <
    //                                                     state
    //                                                         .simulatedModelAnswers
    //                                                         .answers!
    //                                                         .length -
    //                                                         1) {
    //                                                   setState(() {
    //                                                     pageViewIndex++;
    //                                                   });
    //                                                   _pageController
    //                                                       .animateToPage(
    //                                                     pageViewIndex,
    //                                                     duration:
    //                                                     const Duration(
    //                                                         milliseconds:
    //                                                         500),
    //                                                     curve: Curves
    //                                                         .easeInOut,
    //                                                   );
    //                                                 } else {
    //                                                   Navigator.of(
    //                                                       context)
    //                                                       .pop();
    //                                                 }
    //                                               },
    //                                             )),
    //                                       ]),
    //                                     ),
    //                                   ),
    //                                 ]);
    //                           },
    //                         ),
    //                       ),
    //                     ],
    //                   );
    //                   case RequestStates.loading:
    //                   return const LoadingShimmerList();
    //                 case RequestStates.error:
    //                   return CustomErrorWidget(errorMessage: state.getSimulatedModelAnswersPlansMessage);
    //                 default:
    //                   return const SizedBox.shrink();
    //               }
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  return SizedBox();
  }
}