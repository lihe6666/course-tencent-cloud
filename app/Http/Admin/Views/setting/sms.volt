{% extends 'templates/main.volt' %}

{% block content %}

    {% set template = sms.template|json_decode %}

    <form class="layui-form kg-form" method="POST" action="{{ url({'for':'admin.setting.sms'}) }}">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>基础配置</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">App ID</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="app_id" value="{{ sms.app_id }}" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">App Key</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="app_key" value="{{ sms.app_key }}" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内容签名</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="signature" placeholder="注意：使用的是签名内容，而非签名ID" value="{{ sms.signature }}" lay-verify="required">
            </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title">
            <legend>模板配置</legend>
        </fieldset>
        <table class="layui-table kg-table layui-form">
            <colgroup>
                <col width="12%">
                <col width="15%">
                <col>
                <col width="10%">
            </colgroup>
            <thead>
            <tr>
                <th>名称</th>
                <th>模板编号</th>
                <th>模板内容</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>身份验证</td>
                <td><input class="layui-input" type="text" name="template[verify]" value="{{ template.verify }}" lay-verify="required"></td>
                <td><input id="tc-verify" class="layui-input" type="text" value="验证码：{1}，{2} 分钟内有效，如非本人操作请忽略。" readonly="readonly"></td>
                <td><span class="kg-copy layui-btn" data-clipboard-target="#tc-verify">复制</span></td>
            </tr>
            <tr>
                <td>订单通知</td>
                <td><input class="layui-input" type="text" name="template[order_finish]" value="{{ template.order_finish }}" lay-verify="required"></td>
                <td><input id="tc-order-finish" class="layui-input" type="text" value="下单成功，商品名称：{1}，订单序号：{2}，订单金额：￥{3}" readonly="readonly"></td>
                <td><span class="kg-copy layui-btn" data-clipboard-target="#tc-order-finish">复制</span></td>
            </tr>
            <tr>
                <td>退款通知</td>
                <td><input class="layui-input" type="text" name="template[refund_finish]" value="{{ template.refund_finish }}" lay-verify="required"></td>
                <td><input id="tc-refund-finish" class="layui-input" type="text" value="退款成功，商品名称：{1}，退款序号：{2}，退款金额：￥{3}" readonly="readonly"></td>
                <td><span class="kg-copy layui-btn" data-clipboard-target="#tc-refund-finish">复制</span></td>
            </tr>
            <tr>
                <td>直播提醒</td>
                <td><input class="layui-input" type="text" name="template[live_begin]" value="{{ template.live_begin }}" lay-verify="required"></td>
                <td><input id="tc-live-begin" class="layui-input" type="text" value="直播预告，课程名称：{1}，章节名称：{2}，开播时间：{3}" readonly="readonly"></td>
                <td><span class="kg-copy layui-btn" data-clipboard-target="#tc-live-begin">复制</span></td>
            </tr>
            <tr>
                <td>咨询通知</td>
                <td><input class="layui-input" type="text" name="template[consult_reply]" value="{{ template.consult_reply }}" lay-verify="required"></td>
                <td><input id="tc-consult-reply" class="layui-input" type="text" value="{1} 回复了你的咨询，课程名称：{2}，请登录系统查看详情。" readonly="readonly"></td>
                <td><span class="kg-copy layui-btn" data-clipboard-target="#tc-consult-reply">复制</span></td>
            </tr>
            </tbody>
        </table>
        <div class="layui-form-item" style="margin-top:20px;">
            <label class="layui-form-label"></label>
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="true" lay-filter="go">提交</button>
                <button type="button" class="kg-back layui-btn layui-btn-primary">返回</button>
            </div>
        </div>
    </form>

    <form class="layui-form kg-form" method="POST" action="{{ url({'for':'admin.test.sms'}) }}">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>短信测试</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="phone" placeholder="请先提交相关配置，再进行短信测试哦！" lay-verify="phone">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="true" lay-filter="go">提交</button>
                <button type="button" class="kg-back layui-btn layui-btn-primary">返回</button>
            </div>
        </div>
    </form>

{% endblock %}

{% block include_js %}

    {{ js_include('lib/clipboard.min.js') }}
    {{ js_include('admin/js/copy.js') }}

{% endblock %}