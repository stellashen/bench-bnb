import React from 'react';
import ReactDOM from 'react-dom';
//Components
import Root from './components/root';
import configureStore from './store/store';

// for testing in js console
import { signup, login, logout } from './util/session_api_util';
window.signup = signup;
window.login = login;
window.logout = logout;

document.addEventListener('DOMContentLoaded', () => {
	let store;
	if (window.currentUser) {
		const preloadedState = { session: { currentUser: window.currentUser } };
		store = configureStore(preloadedState);
		delete window.currentUser;
	} else {
		store = configureStore();
	}

	// just for testing!
	window.getState = store.getState;
	window.dispatch = store.dispatch;

	const root = document.getElementById('root');
	ReactDOM.render(<Root store={store}/>, root);
});
