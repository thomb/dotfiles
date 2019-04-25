/**
 * Your Extension View
 * Author: Thomas Baxter <thomas.baxter@gmail.com.
 */

import YOUR_COMPONENT from './YOUR_COMPONENT';
import React from 'react';
import {shallow} from 'enzyme';

describe('<YOUR_COMPONENT />', () => {
	const DEFAULT_PROPS = {COMPONENT_PROPS};
	const shallowRender = (props) => shallow(<YOUR_COMPONENT {...DEFAULT_PROPS} {...props} />);

	// =====================================================================

	describe('Basic Tests', () => {
		it('should be my component', () => {
			const component = shallowRender();
			expect(component.instance() instanceof YOUR_COMPONENT).toBe(true);
		});

		it('should have the correct displayName', () => {
			expect(YOUR_COMPONENT.displayName).toEqual('YOUR_COMPONENT');
		});

		it('should have these properties by default', () => {
			const component = shallowRender();
			const {...nonFunctionalProps} = component.instance().props;
			expect(nonFunctionalProps).toEqual({
				...DEFAULT_PROPS,
			});
		});
	});

	describe('render', () => {

		it('should render successfully', () => {
			// Ensure the expect DOM structure is created
			const component = shallowRender();
			expect(component).toBeDefined();
		});
	});
});
