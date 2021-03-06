{capture name=path}
    {l s='Оплата банковской картой.' mod='yamodule'}
{/capture}

<h1 class="page-heading">
    {l s='Общая информация' mod='yamodule'}
</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="alert alert-warning">
        {l s='Ваша корзина пуста.' mod='yamodule'}
    </p>
{else}
    <form action="{$payment_link}" method="post">
	<input type="hidden" name="cnf" value="1" checked />
        <div class="box cheque-box">
            <h3 class="page-subheading">
               {l s='credit card payment.' mod='yamodule'}
            </h3>
            <p class="cheque-indent">
                <strong class="dark">
                    {l s='Вы выбрали оплату банковской картой.' mod='yamodule'} {l s='Краткая информация о заказе:' mod='yamodule'}
                </strong>
            </p>
            <p>
                - {l s='Сумма вашего заказа' mod='yamodule'}
                <span id="amount" class="price">{displayPrice price=$total}</span>
                {if $use_taxes == 1}
                    {l s='(вкл. налог)' mod='yamodule'}
                {/if}
            </p>
        </div>
        <p class="cart_navigation clearfix" id="cart_navigation">
        	<a 
            class="button-exclusive btn btn-default" 
            href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}">
                <i class="icon-chevron-left"></i>{l s='Другие методы оплаты' mod='yamodule'}
            </a>
            <button 
            class="button btn btn-default button-medium" 
            type="submit">
                <span>{l s='Я подтверждаю заказ' mod='yamodule'}<i class="icon-chevron-right right"></i></span>
            </button>
        </p>
    </form>
{/if}
