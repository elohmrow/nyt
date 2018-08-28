[#assign imagePosition = content.imagePosition!"below"]

[#if !divClass?has_content]
    [#assign divClass = "text-section"]
[/#if]

[#assign hasImage = false]
[#assign imageHtml = ""]

[#if content.image?has_content]
    [#assign hasImage = true]
    [#assign divClass = "${divClass} text-image-section"]
    [#assign imageClass = "content-image-${imagePosition}"]
    [#assign rendition = damfn.getRendition(content.image, "original")]
    [#include "/mtk/templates/macros/image.ftl"]
    [#assign imageHtml][@image rendition content imageClass false def.parameters /][/#assign]
[/#if]


<div class="${divClass!}"${divID!}>

    [#-- Headline --]
    [#if content.headline?has_content]
        <${headlineLevel}>${content.headline!}</${headlineLevel}>
    [/#if]

    [#-- Image above text --]
    [#if hasImage && imagePosition == "above"]
        ${imageHtml}
    [/#if]

    [#-- Text --]
    [#if content.text?has_content]
        ${cmsfn.decode(content).text!}
    [/#if]

    [#-- Image below text --]
    [#if hasImage && imagePosition == "below"]
        ${imageHtml}
    [/#if]

</div><!-- end ${divClass} -->

