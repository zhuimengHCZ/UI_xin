import common from '@ohos.app.ability.common';
import picker from '@ohos.file.picker';

class MediaUtils {
  //拍照
  takePhoto(context: common.UIAbilityContext, callback: (uri: string) => void) {

    let want = {
      // 'uri': '',
      'action': "ohos.want.action.imageCapture",
      'parameters': { "callBundleName": context.abilityInfo.bundleName
      }
    };
    context.startAbilityForResult(want, (err, result) => {
      if (err && err.code !== 0) {
        console.log("err: " + err);
        return err
      } else {
        if (result.resultCode === 0) {
          let resultUri: string = result.want?.parameters?.resourceUri as string;
          callback(resultUri);
          // if (callback && result.want.uri) {
          //   callback(resultUri);
          // }
        }
      }
    })
  }

  //选择图片
  selectPicture(maxSelectNumber: number, callback: (uris: Array<string>) => void) {
    try {
      let photoSelectOptions = new picker.PhotoSelectOptions();
      photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      photoSelectOptions.maxSelectNumber = maxSelectNumber;
      let photoPicker = new picker.PhotoViewPicker();
      photoPicker.select(photoSelectOptions, (err, result) => {
        if (err) {
          console.log("err: " + err);
          return err
        } else {
          if (result && result.photoUris && result.photoUris.length > 0) {
            callback(result.photoUris)
          }
        }
      })
    } catch (err) {
      Promise.reject(err);
    }
  }

  //选择文件
  selectFile(callback: (uris: Array<string>) => void) {
    try {
      let documentSelectOptions = new picker.DocumentSelectOptions();
      let documentPicker = new picker.DocumentViewPicker();
      return documentPicker.select(documentSelectOptions, (err, result) => {
        if (err) {
          console.log("err: " + err);
          return err
        } else {
          if (result && result.length > 0) {
            callback(result)
          }
        }
      })
    } catch (err) {
      Promise.reject(err);
    }
  }
}

export default new MediaUtils();