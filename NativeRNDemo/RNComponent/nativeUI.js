import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    ScrollView
} from 'react-native';

import TestScollView from './TestScrollView'

var TestScrollViewConsts = require('react-native').UIManager.TestScrollView.Constants;
class NativeUI extends Component {

    constructor(props){
        super(props);
        this.state={
            bannerNum:0
        }
    }

    render() {
        const bannerImgs = [
            'http://upload-images.jianshu.io/upload_images/2321678-ba5bf97ec3462662.png?imageMogr2/auto-orient/strip%7CimageView2/2',
            'http://upload-images.jianshu.io/upload_images/1487291-2aec9e634117c24b.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/480/q/100',
            'http://f.hiphotos.baidu.com/zhidao/pic/item/e7cd7b899e510fb37a4f2df3db33c895d1430c7b.jpg'
        ];

        return (
            <ScrollView style={{marginTop:64}}>
                <View>
                    <TestScollView style={styles.container}
                                    autoScrollTimeInterval = {2}
                                    imageURLStringsGroup = {bannerImgs}
                                    pageControlAliment = {TestScrollViewConsts.SDCycleScrollViewPageContolAliment.right}
                                    onClickBanner={(e) => {
                                        console.log('test' + e.nativeEvent.value);
                                        this.setState({bannerNum:e.nativeEvent.value});
                                    }}
                    />
                    <Text style={{fontSize: 15, margin: 10, textAlign:'center'}}>
                        点击banner -> {this.state.bannerNum}
                    </Text>
                </View>
            </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    container:{
        borderColor:'#e7e7e7',
        marginTop:10,
        height:200,
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});


//export default NativeRNApp;
AppRegistry.registerComponent('NativeRNApp', () => NativeUI);
