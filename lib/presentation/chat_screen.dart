import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_assignment/core/utils/transaction_summary.dart';
import 'package:flutter_ui_assignment/core/utils/user_chat_bubble.dart';
import 'package:flutter_ui_assignment/presentation/bloc/transactionbloc/transaction_bloc.dart';
import 'package:flutter_ui_assignment/presentation/bloc/transactionbloc/transaction_event.dart';
import 'package:flutter_ui_assignment/presentation/bloc/transactionbloc/transaction_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  // Gradient background similar to the image
  final LinearGradient _gradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 152, 130, 211), // Purple start
      // Color(0xFFA7226E), // Magenta middle
      Color.fromARGB(255, 207, 168, 177), // Pink end
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    // Initial data load for the chat message
    context.read<TransactionBloc>().add(
      const LoadTransactionDetails('txn-123'),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: _gradient),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<TransactionBloc, TransactionState>(
                  builder: (context, state) {
                    if (state.isLoading && state.transaction == null) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state.transaction == null) {
                      return const Center(
                        child: Text(
                          'Error loading data.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return ListView(
                      children: [
                        _buildBotMessage(
                          'Your balance decreased because of a \$${state.transaction!.amount.toStringAsFixed(2)} payment to ${state.transaction!.senderName} on ${state.transaction!.date.replaceAll(' 2025', '')}. Would you like me to show you the transaction details?',
                        ),
                        // Suggested Actions
                        _buildSuggestedActions(context),

                        // User Response
                        const UserChatBubble(
                          text: 'Yes, please show me the details.',
                        ),

                        // Transaction Summary (Conditional)
                        if (state.showSummary)
                          TransactionSummaryCard(
                            transaction: state.transaction!,
                          ),

                        // Empty space to push content up if needed
                        const SizedBox(height: 50),
                      ],
                    );
                  },
                ),
              ),
              // Input Field & Bottom Nav
              _buildBottomInputArea(context),
            ],
          ),
        ),
      ),
      // Custom Bottom Navigation Bar
      // bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

Widget _buildBotMessage(String text) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 60),
    child: RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Your balance decreased because of a ',
            style: TextStyle(
              color: Colors.blueGrey,     // ← grey color
              fontSize: 16,           // ← different font size
            ),
          ),
          TextSpan(
            text: text.replaceFirst('Your balance decreased because of a ', ''),
            style: const TextStyle(
              color: Colors.white,    // ← remaining text in white
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildSuggestedActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // View Transaction History Button
          _buildActionButton(
            label: 'View Transaction History',
            labelColor: Colors.blue,
            icon: Icons.search,
            onPressed: () {
              // Action for View History
            },
            context: context,
          ),
          const SizedBox(width: 8),
          // Analyze Money Button (Triggers Summary via BLoC)
          _buildActionButton(
            label: 'Analyze Money',
            labelColor: Colors.orange,
            icon: Icons.bar_chart,
            onPressed: () {
              context.read<TransactionBloc>().add(ShowTransactionSummary());
            },
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color labelColor,
    required IconData icon,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black, size: 18),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style:  TextStyle(color:labelColor, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomInputArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Ask Anything...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white54),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.15),
            ),
            child: const Icon(Icons.mic, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.15),
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
