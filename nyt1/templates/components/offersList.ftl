[#assign previewCountry = ctx.getParameter('previewCountry')!?html] [#-- there are other ways to do this! --]

<div class='offers-list'>
    [#assign page = cmsfn.page(content)]
    [#assign pageLink = cmsfn.link(page)]
    [#assign offerName = state.getSelector()]
    [#assign offerNode = cmsfn.contentByPath("/"+(offerName!), "offers")]
      
    [#if offerName?has_content && offerNode?has_content]

        [#if offerNode.name?has_content] 
            <h3>${offerNode.name}</h3>
        [/#if]
        [#if offerNode.location?has_content] 
            <h4>[#if offerNode.date?has_content] ${offerNode.date?string["dd.MM.YYYY"]!} - [/#if]${offerNode.location}</h4>
        [/#if]
        
        ${offerNode.description!}
        
        [#if pageLink?has_content]
            <a href="${pageLink!}">Show all offers</a>
        [/#if]

    [#else] [#-- IF THERE IS NO SELECTOR, LIST OF offerS WILL BE DISPLAYED --]
        
        [#assign offersRoot = cmsfn.contentByPath("/", "offers")]
        [#assign offers = cmsfn.children(offersRoot,"offer")![]]

        [#list offers]
            <ul class="list-group">
                <li class="list-group-item active">Total offers: ${offers?size} </li>
                [#items as offer]
		    [#if previewCountry != offer.country] [#-- there are other ways to do this! --]
			[#continue] [#-- go to the next item if it's not the right country --]
		    [/#if]
                    [#-- It might be, that the page link does not contain '.html' and/or ends with '/' --]
                    [#assign linkWithSelector = ensureLinkEndsWithDotHtml(pageLink)?replace('.html','~'+offer.@name+'~.html')] 
                    
                    [#if linkWithSelector?has_content && offer.name?has_content]     
                        <a href="${linkWithSelector}" class="list-group-item"><small>offer #${offer_index+1}: </small> ${offer.name} [#if offer.date?has_content][${offer.date?string["dd.MM.YY"]}][/#if]</a>
                    [#else]
                        <li class="list-group-item"><small>offer #${offer_index+1}: </small> ${offer.name} [#if offer.date?has_content][${offer.date?string["dd.MM.YY"]}][/#if]</li>
                    [/#if]
                [/#items]
            </ul>
        [/#list]






    [/#if]

</div>


[#function ensureLinkEndsWithDotHtml link]

    [#if !link?contains(".html")]
        [#if link?ends_with("/")]
            [#assign link = link?keep_before_last('/')]
        [/#if]
        [#return link+'.html']
    [/#if]       
    
    [#return link]
    
[/#function]
