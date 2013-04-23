Plugin = Mercury.registerPlugin 'link'
  description: 'Provides interface for inserting and editing links.'
  version: '1.0.0'

  actions:
    link: 'insert'

  registerButton: ->
    @button.set(type: 'link')

  onButtonClick: ->
    new Plugin.Modal()

  insert: ->


class Plugin.Modal extends Mercury.Modal
  template:  'link'
  className: 'mercury-link-modal'
  title:     'Link Manager'
  width:     600


@JST ||= {}
JST['/mercury/templates/link'] ||= ->
  """
  <form class="form-horizontal">
    <div class="form-inputs">

      <fieldset class="link_text_container">
        <div class="control-group string required">
          <label class="string optional control-label" for="link_text">Link Content</label>
          <div class="controls">
            <input class="span6 string optional" id="link_text" name="link[text]" size="50" type="text">
          </div>
        </div>
      </fieldset>

      <fieldset>
        <legend>Standard Links</legend>
        <div class="control-group url optional">
          <label class="url optional control-label" for="link_external_url">
            <input name="link_type" type="radio" value="external_url" checked="checked"/>URL
          </label>
          <div class="controls">
            <input class="span6 string url optional" id="link_external_url" name="link[external_url]" size="50" type="text">
          </div>
        </div>
      </fieldset>

      <fieldset>
        <legend>Index / Bookmark Links</legend>
        <div class="control-group select optional">
          <label class="select optional control-label" for="link_existing_bookmark">
            <input name="link_type" type="radio" value="existing_bookmark"/>Existing Links
          </label>
          <div class="controls">
            <select class="select optional" id="link_existing_bookmark" name="link[existing_bookmark]"></select>
          </div>
        </div>
        <div class="control-group string optional">
          <label class="string optional control-label" for="link_new_bookmark">
            <input name="link_type" type="radio" value="new_bookmark"/>Bookmark
          </label>
          <div class="controls">
            <input class="string optional" id="link_new_bookmark" name="link[new_bookmark]" size="50" type="text">
          </div>
        </div>
      </fieldset>

      <fieldset>
        <legend>Options</legend>
        <div class="control-group select optional">
          <label class="select optional control-label" for="link_target">Link Target</label>
          <div class="controls">
            <select class="select optional" id="link_target" name="link[target]">
              <option value="">Self (the same window or tab)</option>
              <option value="_blank">Blank (a new window or tab)</option>
              <option value="_top">Top (removes any frames)</option>
              <option value="popup">Popup Window (javascript new window popup)</option>
            </select>
          </div>
        </div>
        <div id="popup_options" class="link-target-options" style="display:none">
          <div class="control-group number optional">
            <label class="number optional control-label" for="link_popup_width">Popup Width</label>
            <div class="controls">
              <input class="span2 number optional" id="link_popup_width" name="link[popup_width]" size="50" type="number" value="960">
            </div>
          </div>
          <div class="control-group number optional">
            <label class="number optional control-label" for="link_popup_height">Popup Height</label>
            <div class="controls">
              <input class="span2 number optional" id="link_popup_height" name="link[popup_height]" size="50" type="number" value="800">
            </div>
          </div>
        </div>
      </fieldset>

    </div>
    <div class="form-actions">
      <input class="btn btn-primary" name="commit" type="submit" value="Insert Link">
    </div>
  </form>
  """
