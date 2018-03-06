import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View
} from 'react-native';
import {
    NativeModules,
    NativeEventEmitter
} from 'react-native';

var NativetoRNManager = NativeModules.NativetoRNManager;
var NativetoRNManagerEmitter = new NativeEventEmitter(NativetoRNManager);

var subscription;


class NativeRNApp extends Component {
    constructor(props) {
        //props 只读属性
        super(props);
        //state 支持读写
        this.state = {
            notice:''
        };

        // 监听事件 ES6 类中函数必须手动绑定
        // this.handleChange = this.handleChange.bind(this);
    }

    //即将加载
    componentWillMount() {

    }

    //已经加载
    componentDidMount() {
        console.log('开始订阅通知...');
        //  NativetoRNManager.receiveNotificationName 为原生定义常量
        NativetoRNManager.startReceiveNotification(NativetoRNManager.receiveNotificationName);

        //监听Native传过来的事件。
        subscription = NativetoRNManagerEmitter.addListener(
            'EventReminder',
            (reminder) => {
                this.setState({notice:reminder.name});
            }
        );

    }

    //即将消失
    componentWillUnmount() {
        subscription.remove();
    }

    render() {
        return (
            <View >
                <Text>
                   通过监听事件接受到原生消息： {this.state.notice}
                </Text>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
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

AppRegistry.registerComponent('NativeRNApp', () => NativeRNApp);

//设置props属性的默认类型
//App.propTypes = {
//  name: React.PropTypes.string.isRequired
//};
//设置props属性的默认值
//App.defaultProps = {
//    name: ''
//};