import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infra/infra.dart';
import 'cubit/daily_cubit.dart';
import 'cubit/daily_state.dart';
import 'widgets/post_shimmer_widget.dart';
import 'widgets/post_widget.dart';

class DailyPage extends StatefulWidget {
  final ScrollController scrollController;

  const DailyPage({super.key, required this.scrollController});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage>
    with AutomaticKeepAliveClientMixin<DailyPage> {
  late DailyCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get()..getDailyIdeas();
  }

  @override
  void dispose() {
    super.dispose();

    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PullToRefresh(
      onRefresh: _cubit.getDailyIdeas,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'expires_in'.translate(),
                style: AppTextStyles.bodyCompactSmall,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'daily_ideas'.translate(),
                style: AppTextStyles.bodyCompactLarge,
              ),
            ),
            const SizedBox(height: 36.0),
            BlocBuilder<DailyCubit, DailyState>(
              bloc: _cubit,
              builder: (_, event) {
                switch (event.state) {
                  case LoadingState():
                    return const PostShimmerWidget();

                  case FailureState failure:
                    return CustomError(
                      errorMessage: failure.message,
                      onRetry: _cubit.getDailyIdeas,
                    );

                  default:
                    return ListView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: event.ideas.length,
                      itemBuilder: (_, index) {
                        final idea = event.ideas[index];

                        return PostWidget(
                          ideas: idea,
                        );
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
