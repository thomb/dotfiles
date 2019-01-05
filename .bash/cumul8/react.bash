newc () {
	cp ~/code/templates/ComponentTemplate.js $1.js;
	vi $1.js
}

newt () {
	cp ~/code/templates/ComponentTestTemplate.js $1.test.js;
	vi $1.test.js
}

newtr() {
	cp ~/code/templates/ReducerTestTemplate.js $1.test.js;
	vi $1.test.js
}

newta() {
	cp ~/code/templates/ActionTestTemplate.js $1.test.js;
	vi $1.test.js
}
