# Creating forms

The interface of the *Annotation* app is fully configurable that can be adapted it to any project.

The forms are defined in `.ui` text files which have to be in the `Documents` folder of the device.

[image]

These files can be created using any text editor.

## Creating user forms

The controls have the following syntax:

    Control_type {
        parameter: value
        other_parameter: value
    }

There are three parameters, which are common for most controls:

- `id`: this is the ***unique*** identifier of the control. This parameter ***must*** be defined to all contols, except `BSeparator`.

- `label`: the label displayed with the control (all, except `GPSWidget`)

- `persistent`: if this is set to `true`, the control will keep its value after the data is saved; otherwise it resets to the default value (all the input controls)

### Control types

**BEdit**: a text/number field.

Parameters:

- `id` - unique identifier
- `label` - label to be shown near the control
- `persistent` - set to `true` to keep the value of the control after saving the data
- `textwidth` - sets the width of the text field
- `numberfield` - set to `true` to accept only numbers. This also sets the on-screen keyboard to numeric.

**BSpinBox**: a number field with +/- buttons to change its value.

Parameters:

- `id` - unique identifier
- `label` - label to be shown near the control
- `persistent` - set to `true` to keep the value of the control
- `autoincrement` - set to `true` to increment the value of the control after saving a data
- `defaultvalue` - the initial value of the control. When the spinbox is reset, it will take this value again.
- `maxvalue` - the upper limit of the value

**BSlider**: a slider. The parameters are similar to `BSpinBox`.

Parameters:

- `id` - unique identifier
- `label` - label to be shown near the control
- `persistent` - set to `true` to keep the value of the control
- `defaultvalue` - the initial value of the control. When the spinbox is reset, it will take this value again.
- `maxvalue` - the upper limit of the value

**BCheckBox**: a check box

Parameters:

- `id` - unique identifier
- `label` - label of the check box
- `persistent` - set to `true` to keep the value of the control

**BComboBox**: a control with selectable values

Parameters:

- `id` - unique identifier
- `label` - label to be shown near the combo box
- `persistent` - set to `true` to keep the value of the control
- `items` - the list of the items of the control in format: `["Item1","Item2",...]`

**BSeparator**: Adds a separator with a title to the interface. Useful for grouping controls

Parameters:

- `label` - title of the next group

*Note:* Do not set an `id` for a `BSeparator` control!

**GPSWidget**: shows the GPS coordinates. Use this to add georeferencing to the data.

Parameters:

- `id` - unique identifier

**CameraWidget**: a widget to take a photo. The photo will be saved to the pictures folder (e.g. `DCIM` on mobile devices) with file name `annot_[date]_[time].jpg`

Parameters:

- `id` - unique identifier
