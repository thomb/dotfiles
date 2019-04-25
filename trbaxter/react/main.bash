export REACT_TEMPLATE_LOCATION="$CUSTOM_SCRIPT_LOCATION/react/templates"
#create a new react component
newc () {
	cp $REACT_TEMPLATE_LOCATION/ComponentTemplate.js $1.js;
	vi $1.js
}

# Create a new test for a react component
newt () {
	cp $REACT_TEMPLATE_LOCATION/ComponentTestTemplate.js $1.test.js;
	vi $1.test.js
}
