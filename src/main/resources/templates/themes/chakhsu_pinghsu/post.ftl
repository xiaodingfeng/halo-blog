<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="${post.title!} | ${blog_title!}"></@header>

<#if settings.post_picture!false>
    <#if post.thumbnail?? && post.thumbnail!=''>
        <div class="post-header-thumb <#if !settings.post_color!false>bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>">
            <div class="post-header-thumb-op" style="background-image:url(${post.thumbnail});"></div>
            <div class="post-header-thumb-cover">
                <div class="post-header-thumb-container">
                    <div class="post-header-thumb-title">
                        ${post.title!}
                    </div>
                    <div class="post-header-thumb-meta">
                        <time datetime="${post.createTime}" itemprop="datePublished">
                            Published on ${post.createTime?string('MMM d,yyyy')}
                        </time>
                        in
                        <#if post.categories?? && post.categories?size gt 0>
                            <a href="${post.categories[0].fullPath!}">${post.categories[0].name}</a>
                        </#if>
                        with<a href="#comments"> ${post.commentCount!0} comment</a>
                    </div>
                    <div class="post-tags">
                        <#if tags?? && tags?size gt 0>
                            <#list tags as tag>
                                <a href="${tag.fullPath!}">${tag.name!}</a>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    <#else>
        <div class="post-header-thumb <#if !settings.post_color!false>bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>">
            <div class="post-header-thumb-op" style="background-image:url(${theme_base!}/source/images/thumbs/<@fun.randThumbs/>);"></div>
            <div class="post-header-thumb-cover">
                <div class="post-header-thumb-container">
                    <div class="post-header-thumb-title">
                        ${post.title!}
                    </div>
                    <div class="post-header-thumb-meta">
                        <time datetime="${post.createTime}" itemprop="datePublished">
                            Published on ${post.createTime?string('MMM d,yyyy')}
                        </time>
                        in
                        <#if post.categories?? && post.categories?size gt 0>
                            <a href="${post.categories[0].fullPath!}">${post.categories[0].name}</a>
                        </#if>
                        with<a href="#comments"> ${post.commentCount!0} comment</a>
                    </div>
                    <div class="post-tags">
                        <#if tags?? && tags?size gt 0>
                            <#list tags as tag>
                                <a href="${tag.fullPath!}">${tag.name!}</a>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</#if>
    <article class="main-content <#if settings.post_picture!false>post-page<#else>page-page</#if>" itemscope itemtype="http://schema.org/Article">
        <div class="post-header">
            <h1 class="post-title" itemprop="name headline">
                ${post.title!}
            </h1>
            <div class="post-data">
                <time datetime="${post.createTime}" itemprop="datePublished">
                    Published on ${post.createTime?string('MMM d,yyyy')}
                </time>
                in
                <#if post.categories?? && post.categories?size gt 0>
                    <a href="${post.categories[0].fullPath!}">${post.categories[0].name}</a>
                </#if>
                with<a href="#comments"> ${post.commentCount!0} comment</a>
            </div>
        </div>
        <div id="post-content" class="post-content" itemprop="articleBody">
            <p class="post-tags">
                <#if tags?? && tags?size gt 0>
                    <#list tags as tag>
                        <a href="${tag.fullPath!}">${tag.name!}</a>
                    </#list>
                </#if>
            </p>
            ${post.formatContent!}
            <p class="post-info">
                本文由 <a href="${blog_url!}"><b>${user.nickname!}</b></a> 创作，采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank" rel="external nofollow">知识共享署名4.0</a>
                国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>最后编辑时间为: ${post.editTime?string('MMM d,yyyy')}
            </p>
        </div>
    </article>

    <div id="post-bottom-bar" class="post-bottom-bar">
        <div class="bottom-bar-inner">
            <div class="bottom-bar-items social-share left">
                <span class="bottom-bar-item">Share : </span>
                <span class="bottom-bar-item bottom-bar-facebook">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=${post.fullPath!}" target="_blank" title="${post.title!}" rel="nofollow">
                        facebook
                    </a>
                </span>
                <span class="bottom-bar-item bottom-bar-twitter">
                    <a href="https://twitter.com/intent/tweet?url=${post.fullPath!}&text=${post.title!}" target="_blank" title="${post.title!}" rel="nofollow">
                        Twitter
                    </a>
                </span>
                <span class="bottom-bar-item bottom-bar-weibo">
                    <a href="http://service.weibo.com/share/share.php?url=${post.fullPath!}&amp;title=${post.title!}" target="_blank" title="${post.title!}" rel="nofollow">
                        Weibo
                    </a>
                </span>
                <#--  <span class="bottom-bar-item bottom-bar-qrcode">
                    <a href="//pan.baidu.com/share/qrcode?w=300&amp;h=300&amp;url=${post.fullPath!}" target="_blank" rel="nofollow">
                        QRcode
                    </a>
                </span>  -->
            </div>
            <div class="bottom-bar-items right">
                <span class="bottom-bar-item">
                    <#if prevPost??>
                        <a href="${prevPost.fullPath!}" title="${prevPost.title!}">←</a>
                    </#if>
                </span>
                <span class="bottom-bar-item">
                    <#if nextPost??>
                        <a href="${nextPost.fullPath!}" title="${nextPost.title!}">→</a>
                    </#if>
                </span>
                <span class="bottom-bar-item"><a href="#footer">↓</a></span>
                <span class="bottom-bar-item"><a href="#">↑</a></span>
            </div>
        </div>
    </div>
<#include "comment.ftl">
<@comment post=post type="post" />
<#include "footer.ftl">
