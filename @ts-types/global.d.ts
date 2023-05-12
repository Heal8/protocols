declare const heal: {
	client: {
		protocolOperations: {
			checkAnswerMatch(forms: any[], keys: any): boolean,
			getAnswer(forms: any[], answerId: string): string,
			getAnswerData(forms: any[], answerId: string): any,
			getFormData(protocol: any, id: string, findLast?: boolean): any,
			getNotification(protocol: any, findLast?: boolean): any,
			createNotification(group: string, componentId: string, text: string, data?: any): any,
			setRecurrence(notification: any, startDate: Date, period: string, value: number, skipEvery?: number): void,
			showPage(offset: number): void,
			componentReady(props: any),
			scrollTo(x: number, y: number): void,
			resetScroller(): void,
			getResUrl(protocol: any, resPath: string): string,
			openFindDoctor(serverFilter: any, uiFilter: any),
			navigateToBookAppointment(): void,
			consts: {
				MONTH_PERIOD: string,
				DAY_PERIOD: string,
				YEAR_PERIOD: string,
				HOUR_PERIOD: string,
				MINUTE_PERIOD: string
			}
		}
	}
};

declare const showMessage: (message: string, callback?: () => void) => void;
declare const showConfirm: (message: string, confirmCallback: () => void, cancelCallback?: () => void) => void;