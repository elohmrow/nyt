[#if content.quotation?has_content]
<blockquote>
<p>${cmsfn.decode(content).quotation}</p>
    [#if content.citedPerson?has_content]<cite>${content.citedPerson}</cite>[/#if]
</blockquote>
[/#if]
