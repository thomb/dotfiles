export REACT_TEMPLATE_LOCATION="$CUSTOM_SCRIPT_LOCATION/react/templates"
#create a new react component
newc () {
    mkdir $1
    cd $1
	cp $REACT_TEMPLATE_LOCATION/ComponentTemplate.js $1.js;
	cp $REACT_TEMPLATE_LOCATION/ComponentTestTemplate.js $1.test.js;
	vi $1.js
}

# Create a new test for a react component
newt () {
	cp $REACT_TEMPLATE_LOCATION/ComponentTestTemplate.js $1.test.js;
	vi $1.test.js
}
