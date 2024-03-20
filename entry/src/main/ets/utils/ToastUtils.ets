import promptAction from '@ohos.promptAction';

///从API Version 8 开始，该接口不再维护(Prompt.showToast)，推荐使用新接口@ohos.promptAction (弹窗)
export default function showToast(message: string, duration: number = 2000) {
  try {
    promptAction.showToast({
      message: message,
      duration: duration,
      bottom: "center",
    })
  } catch (error) {
    console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
  }
}