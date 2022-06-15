
# snippetcoder_utils

SnippetCoderUtils is a Utility package built with Flutter SDK to make Flutter development easier and more enjoyable than ever.

[![pub package](https://img.shields.io/badge/snippet_coder_utils-v1.0.12-blue.svg)](https://pub.dartlang.org/packages/snippet_coder_utils)

## Features
- FormHelper Utility to create custom UI `TextBox`, `DropDown`, `Buttons`.
- DataTable Utility with `Generic Collection`, `Sorting`, `Edit`, `Delete` & `Custom Action Button`
- ProgressHUD (Heads Up Display)
- Hex Color Converter.
- Multiple Image Picker with Add and Remove image.

## Install
Add this to your pubspec.yaml file:
```yaml
dependencies:
  snippetcoder_utils: ^1.0.12
```

## Usage

### FormHelper

This utility will be used to create custom UI `TextBox`, `DropDown`, `Buttons`.

#### FormHelper - inputFieldWidget
<img src="https://i.imgur.com/evwqVC5.png" />

```dart
 FormHelper.inputFieldWidget(
    context,
    "host",
    "Host URL",
    (onValidateVal) {
    if (onValidateVal.isEmpty) {
        return 'Host URL can\'t be empty.';
    }

    return null;
    },
    (onSavedVal) => {
        this.loginModel.host = onSavedVal,
    },
    initialValue: this.loginModel.host,
    obscureText: false,
    borderFocusColor: Theme.of(context).primaryColor,
    prefixIconColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColor,
),

FormHelper.submitButton(
    "Login",
    () {
    
    },
    btnColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColor,
    txtColor: Colors.black,
),
```


#### FormHelper - inputFieldWidgetWithLabel
<img src="https://i.imgur.com/9o6ogIY.png" />

```dart
FormHelper.inputFieldWidgetWithLabel(
    context,    
    "name",
    "Category Name",
    "",
    (onValidateVal) {
    if (onValidateVal.isEmpty) {
        return 'Category Name can\'t be empty.';
    }

    return null;
    },
    (onSavedVal) => {
        this.categoryModel.name = onSavedVal,
    },
    initialValue: this.categoryModel.name,
    obscureText: false,
    borderFocusColor: Theme.of(context).primaryColor,
    prefixIconColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColor,
    borderRadius: 10,
    paddingLeft: 0,
    paddingRight: 0,
    showPrefixIcon: true,
    prefixIcon: Icon(Icons.web),
    onChange: (val) {},
),
FormHelper.inputFieldWidgetWithLabel(
    context,   
    "description",
    "Category Description",
    "",
    (onValidateVal) {
    return null;
    },
    (onSavedVal) => {
        this.categoryModel.description = onSavedVal,
    },
    initialValue: this.categoryModel.description,
    obscureText: false,
    borderFocusColor: Theme.of(context).primaryColor,
    prefixIconColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColor,
    borderRadius: 10,
    paddingLeft: 0,
    paddingRight: 0,
    showPrefixIcon: true,
    prefixIcon: Icon(Icons.web),
    isMultiline: true,
    onChange: (val) {},
),
```

#### Constructors Parameters
| Parameter | Type | Optional | Description |
|---|---|---|---
| `context` | BuildContext | NO | Pass the current build context. |
| `keyName` | String | NO | Key for the textbox, should be unique for every textbox. |
| `labelName` | String | NO | LabelName will be used if using inputFieldWidgetWithLabel method to show label with TextBox. |
| `hintText` | String | NO | Used to show placeholder in textbox |
| `onValidate` | Function(String) | NO | Fired on textbox Validation |
| `onSaved` | Function(String) | NO | Fires on form Saved. |
| `onChange` | Function(String) | YES | Fires when textbox value changed. |
| `initialValue` | String | YES | Used for showing initial value in textbox. |
| `obscureText` | bool | YES | Used for showing or hiding text. `Default value = false` |
| `fontSize` | double | YES | Used for TextFormField font size. `Default value = 18` |
| `hintFontSize` | double | YES | Used for TextFormField hint font size. `Default value = 15` |
| `paddingLeft` | double | YES | Used for TextFormField Container padding left. `Default value = 20` |
| `paddingRight` | double | YES | Used for TextFormField Container padding right. `Default value = 20` |
| `paddingTop` | double | YES | Used for TextFormField Container padding top. `Default value = 0` |
| `paddingBottom` | double | YES | Used for TextFormField Container padding bottom. `Default value = 0` |
| `suffixIcon` | Widget | YES | Used for TextFormField SuffixIcon Widget |
| `borderRadius` | double | YES | Used for TextFormField Border Radius. `Default value = 30` |
| `borderColor` | Color | YES | Used for TextFormField Border Color. `Default value = Colors.redAccent` |
| `borderFocusColor` | Color | YES | Used for TextFormField Border Focus Color. `Default value = Colors.redAccent` |
| `showPrefixIcon` | bool | YES | Used for Show/Hide Prefix Icon. `Default value = Colors.true` |
| `prefixIcon` | Icon | YES | Used to show Prefix Icon |
| `prefixIconColor` | Color | YES | Used for PrefixIcon Color. `Default value = Colors.redAccent` |
| `prefixIconPaddingLeft` | double | YES | Used for PrefixIcon Padding Left. `Default value = 30` |
| `prefixIconPaddingRight` | double | YES | Used for PrefixIcon Padding Right. `Default value = 10` |
| `prefixIconPaddingTop` | double | YES | Used for PrefixIcon Padding Top. `Default value = 0` |
| `prefixIconPaddingBottom` | double | YES | Used for PrefixIcon Padding Bottom. `Default value = 0` |
| `isMultiline` | bool | YES | Used for making TextFormField Multiline. `Default value = false` |
| `textColor` | Color | YES | Used for TextFormField Text Color. `Default value = Colors.black` |
| `hintColor` | Color | YES | Used for TextFormField Hint Color. `Default value = Colors.black` |
| `validationColor` | Color | YES | Used for TextFormField Validations Color. `Default value = Colors.redAccent` |
| `borderWidth` | double | YES | Used for Border Width. `Default value = 2` |
| `focusedBorderWidth` | double | YES | Used for Focus Border Width. `Default value = 2` |
| `enabledBorderWidth` | double | YES | Used for Enabled Border Width. `Default value = 1` |
| `contentPadding` | double | YES | Used for Content Padding. `Default value = 6` |
| `multilineRows` | double | YES | Used for Multiline Texbox no. of Rows. `Default value = 4` |
| `isNumeric` | double | YES | Used for Numeric Texbox for showing numeric keyboard. `Default value = false` |
| `backgroundColor` | Color | YES | Used for Texbox background color. `Default value = Colors.transparent` |


#### FormHelper - dropDownWidget
<img src="https://i.imgur.com/Vbjf4eL.png" />

```dart
 List<dynamic> productTypesList = [];
 this.productTypesList.add({"id": "simple", "name": "Simple"});
 this.productTypesList.add({"id": "variable", "name": "Variable"});

 FormHelper.dropDownWidget(
    context,
    "Select Product Type",
    "",
    this.productTypesList,
    (onChangedVal) {
        this.requestModel.productType = onChangedVal! ?? "";
    },
    (onValidateVal) {
        if (onValidateVal == null) {
            return 'Please Select Product Type';
        }

        return null;
    },
    borderFocusColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColor,
    borderRadius: 10,
),
```

#### FormHelper - dropDownWidgetWithLabel
<img src="https://i.imgur.com/msYHCUk.png" />

```dart
 List<dynamic> productTypesList = [];
 this.productTypesList.add({"val": "1", "label": "Simple"});
 this.productTypesList.add({"val": "2", "label": "Variable"});

 FormHelper.dropDownWidgetWithLabel(
    context,
    "Product Type"
    "Select Product Type",
    "",
    this.productTypesList,
    (onChangedVal) {
        this.requestModel.productType = onChangedVal! ?? "";
    },
    (onValidateVal) {
        if (onValidateVal == null) {
            return 'Please Select Product Type';
        }

        return null;
    },
    borderFocusColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColor,
    borderRadius: 10,
    optionValue: "val",
    optionLabel: "label"
),
```

#### Constructors Parameters
| Parameter | Type | Optional | Description |
|---|---|---|---
| `context` | BuildContext | NO | Pass the current build context. |
| `labelName` | String | NO | LabelName will be used if using dropDownWidgetWithLabel method to show label with Dropdown. |
| `hintText` | String | NO | Used to show Hint Text in Dropdown |
| `value` | Dynamic | NO | Used for showing initial value in Dropdown. |
| `lstData` | List\<dynamic> | NO | Dropdown list Data |
| `onChanged` | Function(String) | YES | Fires when dropdown value changed. |
| `onValidate` | Function(String) | NO | Fired on dropdown Validation |
| `hintFontSize` | double | YES | Used for DropdownField hint font size. `Default value = 15` |
| `borderColor` | Color | YES | Used for DropdownField Border Color. `Default value = Colors.redAccent` |
| `borderRadius` | double | YES | Used for DropdownField Border Radius. `Default value = 30` |
| `borderFocusColor` | Color | YES | Used for DropdownField Border Focus Color. `Default value = Colors.redAccent` |
| `paddingLeft` | double | YES | Used for DropdownField Container padding left. `Default value = 20` |
| `paddingRight` | double | YES | Used for DropdownField Container padding right. `Default value = 20` |
| `paddingTop` | double | YES | Used for DropdownField Container padding top. `Default value = 0` |
| `paddingBottom` | double | YES | Used for DropdownField Container padding bottom. `Default value = 0` |
| `optionValue` | String | YES | Used for DropdownField Option Value Column Mapping from Data Collection. `Default value = id` |
| `optionLabel` | String | YES | Used for DropdownField Option Label Column Mapping from Data Collection. `Default value = name` |
| `contentPadding` | double | YES | Used for Content Padding. `Default value = 6` |
| `validationColor` | Color | YES | Used for TextFormField Validations Color. `Default value = Colors.redAccent` |
| `textColor` | Color | YES | Used for TextFormField Text Color. `Default value = Colors.black` |
| `hintColor` | Color | YES | Used for TextFormField Hint Color. `Default value = Colors.black` |
| `borderWidth` | double | YES | Used for Border Width. `Default value = 2` |
| `focusedBorderWidth` | double | YES | Used for Focus Border Width. `Default value = 2` |
| `enabledBorderWidth` | double | YES | Used for Enabled Border Width. `Default value = 1` |
| `suffixIcon` | Widget | YES | Used for TextFormField SuffixIcon Widget |
| `prefixIcon` | Icon | YES | Used to show Prefix Icon |
| `showPrefixIcon` | bool | YES | Used for Show/Hide Prefix Icon. `Default value = Colors.true` |
| `prefixIconColor` | Color | YES | Used for PrefixIcon Color. `Default value = Colors.redAccent` |
| `prefixIconPaddingLeft` | double | YES | Used for PrefixIcon Padding Left. `Default value = 30` |
| `prefixIconPaddingRight` | double | YES | Used for PrefixIcon Padding Right. `Default value = 10` |
| `prefixIconPaddingTop` | double | YES | Used for PrefixIcon Padding Top. `Default value = 0` |
| `prefixIconPaddingBottom` | double | YES | Used for PrefixIcon Padding Bottom. `Default value = 0` |


### ListUtils
<img src="https://i.imgur.com/X7xvsps.png" />

This utility will be used to create DataTable list with `Generic Collection`, `Sorting`, `Edit`, `Delete` & `Custom Action Button`


```dart
 return ListUtils.buildDataTable<CategoryModel>(
    context,
    ["Name", "Description", ""],
    ["name", "description", ""],
    sortAscending,
    sortColumnIndex,
    model.categoriesList,
    (CategoryModel onEditVal) {
        print(onEditVal.name);
    },
    (CategoryModel onRemoveVal) {
        print(onRemoveVal.id);
    },
    onSort: (columnIndex, columnName, ascending) {
        print(columnName);
        print(ascending);
    },
    headingRowColor: Theme.of(context).primaryColor,
    actionWidget: Icon(
       Icons.add,
       color: Colors.red,
    ),
    onActionTap: (CategoryModel model) {
        print(model.id);
    },
);
```

#### Constructors Parameters
| Parameter | Type | Optional | Description |
|---|---|---|---
| `context` | BuildContext | NO | Pass the current build context. |
| `columns` | List\<String> | NO | Pass the column name in string array. |
| `fields` | List\<String> | NO | Pass the field name in string array. |
| `sortAscending` | bool | NO | If sorting in ascending order pass `true` else `false`. |
| `sortColumnIndex` | number | NO | Column index of sorting based on. |
| `listOfData` | dynamic | NO | DataSource for the DataTable list. |
| `onEditTap` | Function(dyanmic) | NO | Fires when an edit is tapped and model will be return. |
| `onDeleteTap` | Function(dyanmic) | NO | Fires when an delete is tapped and model will be return. |
| `onSort` | Function(String, String, String) | YES | Fires when an column is click for sorting and it will return `columnIndex`, `columnName`, `ascending`. |
| `headingRowHeight` | number | YES | Used for header row height. `Default value = 45` |
| `headingRowColor` | Color | YES | Used for header row color. `Default value = Colors.redAccent` |
| `columnTextFontSize` | double | YES | Used for column Text font size. `Default value = 15` |
| `columnTextBold` | bool | YES | Used for column Text bold. `Default value = true` |
| `columnSpacing` | bool | YES | Used for column spacing. `Default value = 30` |
| `actionWidget` | Widget | YES | Used for adding custom action button just like edit and delete icon. |
| `onActionTap` | Function(dyanmic) | YES | Fires when an custom action button is tapped and model will be return. |
| `actionEditWidget` | bool | YES | Used for making any custom Edit Widget |
| `actionDeleteWidget` | bool | YES | Used for making any custom Delete Widget |


### ProgressHUD (Heads Up Display)

<img src="https://i.imgur.com/IPVhJ8q.png" />

It's helpful to give the user an indication that content is being loaded while the app sends a network request to get new data.

When we start any network call we will set `isApiCallProcess = true`, when the network call completed we will set back `isApiCallProcess = false`

```dart
bool isApiCallProcess = false;
return Scaffold(
    appBar: _buildAppBar(),
    body: ProgressHUD(
        child: pageUI(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
    ),
);
```

#### Constructors Parameters
| Parameter | Type | Description |
|---|---|---
| `child` | Widget | Assign the widget need to show. |
| `inAsyncCall` | bool | Variable used to show or hide loader. |
| `opacity` | double | Used for transparency of background. |

 
### HexColor

This will be used to convert any HEX color to Flutter Color.

```dart
color: HexColor("#FC4136"),
```

#### Constructors Parameters
| Parameter | Type | Description |
|---|---|---
| `hexColor` | String | HexCode for conversion. |

### MultiImagePicker
<img src="https://i.imgur.com/qlkLSfs.png" />

This widget will be used to show multi select images using `Camera` or `Gallery`.

To get updated images collection, you can use the `onImageChanged` parameter.

```dart
List<Object> images = [];

MultiImagePicker(
    totalImages: 6,
    imageSource: ImagePickSource.camera,
    initialValue: this.productModel.images.map((e) => e.src).toList(), //for showing images from collection
    onImageChanged: (images) {
        this.images = images;
    },
),
```

#### Constructors Parameters
| Parameter | Type | Description |
|---|---|---
| `totalImages` | number | Set the total number of images to be show. |
| `imageSource` | ImagePickSource | Change the Image Source. Can be either &nbsp;`ImagePickSource.camera` or `ImagePickSource.gallery`. |
| `initialValue` | List\<String> | Used for showing default images. |
| `onImageChanged` | Function(List\<Object>) | Fires when an image is added or deleted. |

# Donate

> If you like my work, you can support me buying a cup of :coffee:
>
> - [PayPal](https://www.paypal.me/iSharpeners/)
> - [Patreon](https://www.patreon.com/SnippetCoder)

## Copyright & License

Code and documentation Copyright 2021 [SnippetCoder](https://www.youtube.com/SnippetCoder). Code released under the [Apache License](./LICENSE). Docs released under [Creative Commons](https://creativecommons.org/licenses/by/3.0/).# snippet_coder_utils
# snippet_coder_utils
# snippet_coder_utils
