import PropTypes from 'prop-types';
import React, { Component } from 'react';
import { ImageStyle } from 'react-native';
export declare enum CameraType {
    Front = "front",
    Back = "back"
}
export type Props = {
    focusMode?: string;
    zoomMode?: string;
    cameraRatio?: string;
    ratioOverlay?: string;
    ratioOverlayColor?: string;
    allowCaptureRetake: boolean;
    cameraRatioOverlay: any;
    showCapturedImageCount?: boolean;
    captureButtonImage: any;
    captureButtonImageStyle: ImageStyle;
    cameraFlipImage: any;
    cameraFlipImageStyle: ImageStyle;
    hideControls: any;
    showFrame: any;
    scanBarcode: any;
    laserColor: any;
    frameColor: any;
    torchOnImage: any;
    torchOffImage: any;
    torchImageStyle: ImageStyle;
    onReadCode: (event: any) => void;
    onBottomButtonPressed: (event: any) => void;
};
type State = {
    captureImages: any[];
    flashData: any;
    torchMode: boolean;
    ratios: any[];
    ratioArrayPosition: number;
    imageCaptured: any;
    captured: boolean;
    cameraType: CameraType;
};
export default class CameraScreen extends Component<Props, State> {
    static propTypes: {
        allowCaptureRetake: PropTypes.Requireable<boolean>;
    };
    static defaultProps: {
        allowCaptureRetake: boolean;
    };
    currentFlashArrayPosition: number;
    flashArray: any[];
    camera: any;
    constructor(props: Props);
    componentDidMount(): void;
    isCaptureRetakeMode(): boolean;
    renderFlashButton(): false | React.JSX.Element;
    renderTorchButton(): false | React.JSX.Element;
    renderSwitchCameraButton(): any;
    renderTopButtons(): false | React.JSX.Element;
    renderCamera(): React.JSX.Element;
    numberOfImagesTaken(): number | "1" | "";
    renderCaptureButton(): any;
    renderRatioStrip(): React.JSX.Element | null;
    sendBottomButtonPressedAction(type: string, captureRetakeMode: boolean, image: null): void;
    onButtonPressed(type: string): void;
    renderBottomButton(type: string): React.JSX.Element;
    renderBottomButtons(): false | React.JSX.Element;
    onSwitchCameraPressed(): void;
    onSetFlash(): void;
    onSetTorch(): void;
    onCaptureImagePressed(): Promise<void>;
    onRatioButtonPressed(): void;
    render(): React.JSX.Element;
}
export {};
