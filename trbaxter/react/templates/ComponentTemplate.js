/**
 * Your Extension Test File
 * Author: Thomas Baxter <thomas.baxter@gmail.com.
 */

import React, {type Element, PureComponent} from 'react';
import {Button} from 'aurora-ux';
import i18n from 'i18next';

type PropsType = {};
type StateType = {};
export default class Template extends PureComponent<PropsType, StateType> {
	static displayName = '__template__';


	render (): Element<typeof Button> {

		return (<Button label={i18n.t('Buttons? In my component?')} />);
	}

}
