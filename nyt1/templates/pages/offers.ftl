<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${content.windowTitle!content.title!}</title>
    <meta name="description" content="${content.description!""}" />
    <meta name="keywords" content="${content.keywords!""}" />

    ${resfn.css(["/nyt1/.*css"])!}
  </head>
  <body class="three ${cmsfn.language()}">
    [@cms.area name="main"/]
    
    <div class="container ">
      
    </div>

    ${resfn.js(["/nyt1/.*js"])!}
  </body>
</html>


