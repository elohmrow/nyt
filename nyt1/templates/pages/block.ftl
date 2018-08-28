[#assign testContent = cmsfn.contentByPath("/test", "stories") /]
 
<!DOCTYPE html>
<html xml:lang="en" lang="en" class="no-js">
    <head>
        [@cms.page /]
    </head>
    <body>
        [#if testContent?hasContent]
            [#if testContent.title?hasContent]
                <h2>${testContent.title}</h2>
            [/#if]
            [#if testContent.lead?hasContent]
                <h4>${testContent.lead}</h4>
            [/#if]
            [#assign blocks = cmsfn.children(testContent, "mgnl:block") /]
            [#list blocks as block]
                [@cms.block content=block /]
            [/#list]
        [/#if]
    </body>
</html>
