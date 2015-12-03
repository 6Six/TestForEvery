//
//  ViewController.m
//  WeixinPaymentDemo
//
//  Created by Garry on 15/11/27.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import "WXApiObject.h"
#import "DataMD5.h"
#import "AFNetworking.h"
#import "getIPhoneIP.h"
#import "XMLDictionary.h"

#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payAction:(id)sender
{
    NSString *appid,*mch_id,*nonce_str,*sign,*body,*out_trade_no,*total_fee,*spbill_create_ip,*notify_url,*trade_type,*partner;
    //应用APPID
    appid = @"YourAppId";
    //微信支付商户号
    mch_id = @"商户号";
    ///产生随机字符串，这里最好使用和安卓端一致的生成逻辑
    nonce_str = [self generateTradeNO];
    body = @"16G白色";
    //随机产生订单号用于测试，正式使用请换成你从自己服务器获取的订单号
    out_trade_no = [self getOrderNumber];
    //交易价格1表示0.01元，10表示0.1元
    total_fee = @"100";
    //获取本机IP地址，请再wifi环境下测试，否则获取的ip地址为error，正确格式应该是8.8.8.8
    spbill_create_ip = [getIPhoneIP getIPAddress];
    //交易结果通知网站此处用于测试，随意填写，正式使用时填写正确网站
    notify_url = @"http://202.104.150.136:8097/pay/wxcallback.action";
    trade_type = @"APP";
    //商户密钥
    partner = @"商户秘钥";
    //获取sign签名
    // 
    DataMD5 *data = [[DataMD5 alloc] initWithAppid:appid
                                            mch_id:mch_id
                                         nonce_str:nonce_str
                                        partner_id:partner
                                              body:body
                                      out_trade_no:out_trade_no
                                         total_fee:total_fee
                                  spbill_create_ip:spbill_create_ip
                                        notify_url:notify_url
                                        trade_type:trade_type];
    sign = [data getSignForMD5];
    //设置参数并转化成xml格式
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:appid forKey:@"appid"];//公众账号ID
    [dic setValue:mch_id forKey:@"mch_id"];//商户号
    [dic setValue:nonce_str forKey:@"nonce_str"];//随机字符串
    [dic setValue:sign forKey:@"sign"];//签名
    [dic setValue:body forKey:@"body"];//商品描述
    [dic setValue:out_trade_no forKey:@"out_trade_no"];//订单号
    [dic setValue:total_fee forKey:@"total_fee"];//金额
    [dic setValue:spbill_create_ip forKey:@"spbill_create_ip"];//终端IP
    [dic setValue:notify_url forKey:@"notify_url"];//通知地址
    [dic setValue:trade_type forKey:@"trade_type"];//交易类型
    
    NSString *string = [dic XMLString];
    [self http:string];
}

- (void)http:(NSString *)xml{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //这里传入的xml字符串只是形似xml，但是不是正确是xml格式，需要使用af方法进行转义
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [manager.requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"https://api.mch.weixin.qq.com/pay/unifiedorder" forHTTPHeaderField:@"SOAPAction"];
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
        return xml;
    }];
    
    //发起请求
    [manager POST:@"https://api.mch.weixin.qq.com/pay/unifiedorder" parameters:xml success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] ;
        NSLog(@"responseString is %@",responseString);
        //将微信返回的xml数据解析转义成字典
        NSDictionary *dic = [NSDictionary dictionaryWithXMLString:responseString];
        //判断返回的许可
        if ([[dic objectForKey:@"result_code"] isEqualToString:@"SUCCESS"] &&[[dic objectForKey:@"return_code"] isEqualToString:@"SUCCESS"] ) {
            //发起微信支付，设置参数
            PayReq *request = [[PayReq alloc] init];
            request.partnerId = [dic objectForKey:@"mch_id"];
            request.prepayId= [dic objectForKey:@"prepay_id"];
            request.package = @"Sign=WXPay";
            request.nonceStr= [dic objectForKey:@"nonce_str"];
            //将当前事件转化成时间戳
            NSDate *datenow = [NSDate date];
            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
            UInt32 timeStamp =[timeSp intValue];
            request.timeStamp= timeStamp;
            DataMD5 *md5 = [[DataMD5 alloc] init];
            //此md5方法中要填写你的商户秘钥，切记切记！
            request.sign = [md5 createMD5SingForPay:@"YourAppId"
                                          partnerid:request.partnerId
                                           prepayid:request.prepayId
                                            package:request.package
                                           noncestr:request.nonceStr
                                          timestamp:request.timeStamp];
            
            // 调用微信
            [WXApi sendReq:request];
        }else{
            NSLog(@"参数不正确，请检查参数");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error is %@",error);
    }];
}

#pragma mark 微信支付
///产生随机字符串
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRST";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

//将订单号使用md5加密
-(NSString *) md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16]= "0123456789abcdef";
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//产生随机数
- (NSString *)getOrderNumber{
    int random = arc4random()%10000;
    return [self md5:[NSString stringWithFormat:@"%d",random]];
}

@end
