classdef PageACC < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        AnnUniversitaire20212022Label   matlab.ui.control.Label
        EncadrerparLabel                matlab.ui.control.Label
        PrBOUDABrahimLabel              matlab.ui.control.Label
        RaliserparLabel                 matlab.ui.control.Label
        KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel  matlab.ui.control.Label
        Image2                          matlab.ui.control.Image
        Image                           matlab.ui.control.Image
        EntrerButton                    matlab.ui.control.Button
        DtectiondespointsdintretsLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: EntrerButton
        function EntrerButtonPushed(app, event)
            open("pagePrancipale.mlapp")
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create DtectiondespointsdintretsLabel
            app.DtectiondespointsdintretsLabel = uilabel(app.UIFigure);
            app.DtectiondespointsdintretsLabel.HorizontalAlignment = 'center';
            app.DtectiondespointsdintretsLabel.FontName = 'Algerian';
            app.DtectiondespointsdintretsLabel.FontSize = 26;
            app.DtectiondespointsdintretsLabel.FontWeight = 'bold';
            app.DtectiondespointsdintretsLabel.FontColor = [0 0 1];
            app.DtectiondespointsdintretsLabel.Position = [84 299 456 35];
            app.DtectiondespointsdintretsLabel.Text = 'Détection des points d''intérets ';

            % Create EntrerButton
            app.EntrerButton = uibutton(app.UIFigure, 'push');
            app.EntrerButton.ButtonPushedFcn = createCallbackFcn(app, @EntrerButtonPushed, true);
            app.EntrerButton.BackgroundColor = [0.302 0.7451 0.9333];
            app.EntrerButton.FontSize = 14;
            app.EntrerButton.FontWeight = 'bold';
            app.EntrerButton.Position = [487 10 100 24];
            app.EntrerButton.Text = 'Entrer';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [1 381 100 100];
            app.Image.ImageSource = 'UMI.png';

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.Position = [109 381 100 100];
            app.Image2.ImageSource = 'Fste.png';

            % Create KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel
            app.KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel = uilabel(app.UIFigure);
            app.KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel.FontName = 'Tahoma';
            app.KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel.FontWeight = 'bold';
            app.KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel.FontAngle = 'italic';
            app.KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel.Position = [71 175 176 69];
            app.KARMOUTIsmailNOGOTYoussefELJAMGHILIOmarLabel.Text = {' '; '          KARMOUT Ismail'; '          NOGOT Youssef'; '          ELJAMGHILI Omar'};

            % Create RaliserparLabel
            app.RaliserparLabel = uilabel(app.UIFigure);
            app.RaliserparLabel.FontName = 'Algerian';
            app.RaliserparLabel.FontWeight = 'bold';
            app.RaliserparLabel.FontAngle = 'italic';
            app.RaliserparLabel.Position = [33 230 98 22];
            app.RaliserparLabel.Text = 'Réaliser par :';

            % Create PrBOUDABrahimLabel
            app.PrBOUDABrahimLabel = uilabel(app.UIFigure);
            app.PrBOUDABrahimLabel.FontName = 'Tahoma';
            app.PrBOUDABrahimLabel.FontWeight = 'bold';
            app.PrBOUDABrahimLabel.FontAngle = 'italic';
            app.PrBOUDABrahimLabel.Position = [471 116 116 22];
            app.PrBOUDABrahimLabel.Text = 'Pr. BOUDA Brahim';

            % Create EncadrerparLabel
            app.EncadrerparLabel = uilabel(app.UIFigure);
            app.EncadrerparLabel.FontName = 'Algerian';
            app.EncadrerparLabel.FontWeight = 'bold';
            app.EncadrerparLabel.FontAngle = 'italic';
            app.EncadrerparLabel.Position = [400 137 102 22];
            app.EncadrerparLabel.Text = 'Encadrer par :';

            % Create AnnUniversitaire20212022Label
            app.AnnUniversitaire20212022Label = uilabel(app.UIFigure);
            app.AnnUniversitaire20212022Label.FontWeight = 'bold';
            app.AnnUniversitaire20212022Label.Position = [33 11 176 22];
            app.AnnUniversitaire20212022Label.Text = 'Anné Universitaire: 2021-2022';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Accueil1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end