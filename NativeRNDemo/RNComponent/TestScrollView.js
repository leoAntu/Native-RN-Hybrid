import React, {Component} from 'react';

import {
   requireNativeComponent
} from 'react-native';
import PropTypes from 'prop-types';

// requireNativeComponent 自动把这个组件提供给 "RCTScrollView"
//名字可以随便取
var RCTScrollView = requireNativeComponent('TestScrollView',TestScrollView)

class TestScrollView extends Component {
    static propTypes = {
        autoScrollTimeInterval: PropTypes.number,
        imageURLStringsGroup: PropTypes.array,
        autoScroll: PropTypes.bool,
        onClickBanner: PropTypes.func
     };

    render() {
        return (
            <RCTScrollView {...this.props}/>
        );
    }
}

export default TestScrollView;
