part of '../../payment.dart';

@Injectable()
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CreateOrderUseCase createOrderUseCase;
  final CreatePaymentUseCase createPaymentUseCase;
  final InitiatePaymentUseCase initiatePaymentUseCase;
  final GetUserOrdersUseCase getUserOrdersUseCase;

  PaymentBloc(
    this.createOrderUseCase,
    this.createPaymentUseCase,
    this.initiatePaymentUseCase,
    this.getUserOrdersUseCase,
  ) : super(const PaymentState()) {
    on<CreateOrderEvent>(_createOrder);
    on<CreatePaymentEvent>(_createPayment);
    on<InitiatePaymentEvent>(_initiatePayment);
    on<GetUserOrdersEvent>(_getUserOrders);
  }

  void _createOrder(CreateOrderEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(createOrderState: RequestStates.loading));

    final result = await createOrderUseCase(event.createOrderRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          createOrderState: RequestStates.error,
          createOrderMessage: failure.message,
        ),
      ),
      (entity) {
        entity.log();
        return emit(
          state.copyWith(
            createOrderState: RequestStates.loaded,
            createOrderEntity: entity,
            createOrderMessage: 'Order created successfully',
          ),
        );
      },
    );
  }

  void _createPayment(
    CreatePaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(createPaymentState: RequestStates.loading));

    final result = await createPaymentUseCase(event.createPaymentRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          createPaymentState: RequestStates.error,
          createPaymentMessage: failure.message,
        ),
      ),
      (entity) {
        return emit(
          state.copyWith(
            createPaymentState: RequestStates.loaded,
            paymentEntity: entity,
            createPaymentMessage: 'Payment created successfully',
          ),
        );
      },
    );
  }

  void _initiatePayment(
    InitiatePaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(initiatePaymentState: RequestStates.loading));

    final result = await initiatePaymentUseCase(event.initiatePaymentRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          initiatePaymentState: RequestStates.error,
          initiatePaymentMessage: failure.message,
        ),
      ),
      (entity) {
        return emit(
          state.copyWith(
            initiatePaymentState: RequestStates.loaded,
            initiatePaymentEntity: entity,
            initiatePaymentMessage: 'Payment initiated successfully',
          ),
        );
      },
    );
  }

  void _getUserOrders(
    GetUserOrdersEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(getUserOrdersState: RequestStates.loading));

    final result = await getUserOrdersUseCase(event.getUserOrdersRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          getUserOrdersState: RequestStates.error,
          getUserOrdersMessage: failure.message,
        ),
      ),
      (orders) {
        return emit(
          state.copyWith(
            getUserOrdersState: RequestStates.loaded,
            userOrders: orders,
            getUserOrdersMessage: 'Orders retrieved successfully',
          ),
        );
      },
    );
  }
}
