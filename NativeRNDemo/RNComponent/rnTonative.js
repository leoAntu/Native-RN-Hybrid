import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    TouchableHighlight
} from 'react-native';
import {
    NativeModules,
    NativeAppEventEmitter
} from 'react-native';

import PropTypes from 'prop-types';


var RNtoNativeManager = NativeModules.RNtoNativeManager;

class  CustomButton extends Component {
    render() {
        return (
            <TouchableHighlight
                style={{padding: 8,backgroundColor:this.props.backgroundColor}}
                underlayColor="#a5a5a5"
                onPress={this.props.onPress}
            >
                <Text>{this.props.text}</Text>
            </TouchableHighlight>
        )
    }
}

class NativeRNApp extends Component {
    constructor(props) {
        //props 只读属性
        super(props);
        //state 支持读写
        this.state = {
            events:''
        };

        // 监听事件 ES6 类中函数必须手动绑定
        // this.handleChange = this.handleChange.bind(this);
    }

    //即将加载
    componentWillMount() {

    }

    //已经加载
    componentDidMount() {

    }

    //即将消失
    componentWillUnmount() {

    }

    async updateEvents() {
        try {
            var events = await RNtoNativeManager.findEvents();

            this.setState({ events });
        } catch (e) {
            console.error(e);
        }
    }

    render() {
        var date = new Date();

        return (
            <View>
                <Text>
                    RN调用原生方法
                </Text>
                <CustomButton
                    text="调用testNormalEvent方法-普通"
                    backgroundColor= "#FFFF00"
                    onPress={()=>RNtoNativeManager.testNormalEvent("调用testNormalEvent方法-普通","测试普通调用")}
                />

                <CustomButton text="调用testDateEvent方法-日期处理"
                              backgroundColor= "#FF7F00"
                              onPress={()=>RNtoNativeManager.testDateEvent('调用testDateEvent方法', '测试date格式',date.getTime())}
                />

                <CustomButton text="调用testDictionaryEvent方法-字典"
                              backgroundColor= "#FFFF00"
                              onPress={()=>RNtoNativeManager.testDictionaryEvent('调用testDictionaryEvent方法', {
                                  thing:'测试字典（字段）格式',
                                  time:date.getTime(),
                                  description:'就是这么简单~'
                              })}
                />

                <Text style={{fontSize: 15, margin: 50}}>
                    Callback返回数据：{this.state.events}
                </Text>

                <CustomButton text="调用原生模块testCallbackEvent方法-Callback"
                              backgroundColor= "#00FF00"
                              onPress={()=>RNtoNativeManager.testCallbackEvent((error,events)=>{
                                      if(error){
                                          console.error(error);
                                      }else{
                                          this.setState({events:events,});
                                      }
                                  }
                              )}
                />
                <CustomButton text="调用原生模块testPromiseEvent方法-Promise"
                              backgroundColor= "#00FFFF"
                              onPress={()=>this.updateEvents()}
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({

});


//export default NativeRNApp;
AppRegistry.registerComponent('NativeRNApp', () => NativeRNApp);

//设置props属性的默认类型
//App.PropTypes = {
//  name: PropTypes.string.isRequired
//};

//设置props属性的默认值
//App.defaultProps = {
//    name: ''
//};