function [data, auxData, metaData, txtData, weights] = mydata_Mytilus_californianus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Mytilus_californianus'; 
metaData.species_en = 'California mussel'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Wd'; 't-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Allison Matzelle'; 'Valeria Montalto'; 'Mackenzie Zippay'; 'Alessandro Rinaldi'; 'Gianluca Sara';  'Brian Helmuth'};   
metaData.date_subm = [2013 04 23];           
metaData.email    = {'allisonmatzelle@gmail.com'};  
metaData.address  = {'Northeastern University, Marine Science Center, 430 Nahant Rd, Nahant, MA 01908'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';     label.ab = 'age at birth';              bibkey.ab = 'Schm1999';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from FoxCoe1943';
data.tj = 3;    units.tj = 'd';     label.tj = 'time since birth at metam'; bibkey.tj = 'Schm1999';   
  temp.tj = C2K(18);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;  units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Schm1999';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7300; units.am = 'd';     label.am = 'life span';                 bibkey.am = 'Such1981';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.018; units.Lb  = 'cm'; label.Lb  = 'total length at birth';    bibkey.Lb  = 'Schm1999';
  comment.Lb = 'Mean size of velichonca stage';
data.Lj  = 0.026; units.Lj  = 'cm'; label.Lj  = 'total length at metam';    bibkey.Lj  = 'Schm1999';
data.Lp  = 4;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Such1981';
data.Li  = 20;  units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'Payn1976';

data.Wwp = 0.325; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'FoxCoe1943';
data.Wwi = 100;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Matz2013';

data.Ri  = 1.2e7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'FoxCoe1943';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
  
% t-L data
data.tL =   [ ...    % time since birth (a), shell height (cm)
    1	46.82;
    1.5	52.50;
    2	68.01;
    2.5	66.76;
    3	90.18;
    4	112.54;
    5	105.69;
    6	126.71;
    7	123.83;
    8	157.13;
    9	155.57;
    10	153.39;
    12	160.00;
    15	188.00;];
data.tL(:,1) = 365 * data.tL(:,1); % covert a to d
data.tL(:,2) = data.tL(:,2)/ 10; % covert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Matz2013';
comment.tL = 'obtained by aging shells collected in Strawberry Hill, Oregon, USA during Summer 2012. From LOW intertidal individuals only (i.e. subtidal)';

% L-Wd data
data.LWd = [ ... % shell height (mm), dry weight (g)
    10 0.009;
    20 0.048;
    30 0.164;
    40 0.325;
    50 0.5;
    60 0.93;
    70 1.39;
    80 2;
    90 2.77;
    100 3.37;
    100 2.66;
    101 3.52;
    110 3.2;
    120	5.6;
    125	6.1;
    145	8.07;];
data.LWd(:,1) = data.LWd(:,1)./10;  %convert mm to cm
units.LWd   = {'cm', 'g'};  label.LWd = {'shell height', 'dry weight'};  
bibkey.LWd = 'FoxCoe1943';

% L-Ww data
data.LWw = [ ... % shell height (mm), somatic wet weight (g) (no_gonads)
        14.69	0.12;
        14.90	0.148;
        16.67	0.174;
        18.05	0.278;
        18.38	0.245;
        18.44	0.289;
        19.22	0.334;
        19.40	0.269;
        19.70	0.279;
        19.73	0.375;
        20.02	0.399;
        20.50	0.349;
        20.92	0.361;
        22.01	0.687;
        22.16	0.432;
        22.19	0.363;
        22.63	0.426;
        25.14	0.766;
        25.53	0.646;
        26.86	1.219;
        29.94	1.107;
        31.58	1.754;
        31.80	1.388;
        34.04	0.735;
        35.04	1.496;
        35.64	1.52;
        37.36	2.188;
        37.65	1.808;
        38.43	1.538;
        39.08	2.095;
        39.20	1.877;
        43.73	2.716;
        49.00	3.27;
        52.11	6.001;
        52.20	4.236;
        53.17	4.606;
        54.29	3.971;
        54.53	4.787;
        54.78	5.336;
        54.93	6.04;
        55.32	6.204;
        56.98	5.943;
        57.14	4.776;
        57.70	5.744;
        58.60	5.145;
        58.90	6.241;
        60.10	70.6;
        60.26	5.085;
        60.32	7.294;
        65.62	8.209;
        67.71	7.641;
        68.34	7.877;
        68.38	10.861;
        68.67	9.209;
        70.14	7.989;
        70.56	9.899;
        74.10	10.092;
        74.30	11.151;
        74.63	7.794;
        74.70	10.358;
        74.92	11.287;
        76.13	14.164;
        79.75	12.353;
        82.71	13.652;
        83.23	13.106;
        86.83	18.224;
        87.55	18.064;
        88.02	13.116;
        88.09	12.197;
        89.34	15.348;
        90.00	19.263;
        90.12	16.956;
        93.10	23.989;
        95.60	19.302;
        95.72	18.08;
        97.20	18.585;
        99.03	20.134;
        101.08	23.987;
        101.21	22.859;
        102.43	21.989;
        103.50	30.357;
        105.41	29.507;
        107.48	26.46;
        108.66	24.473;
        109.22	33.319;
        110.84	37.646;
        113.00	27.58;
        114.40	28.752;
        115.26	40.501;
        117.70	33.65;
        118.00	93.813;
        118.49	37.001;
        118.52	38.314;
        122.86	42.44;
        123.70	34.206;
        125.13	58.265;
        125.46	49.255;
        126.74	45.943;
        130.77	29.575;
        132.57	44.472;
        134.62	40.688;
        141.20	73.122;
        146.60	77.161;
        148.51	52.736;
        158.00	82.905;
        160.00	67.738;
        162.00	86.172;
        164.00	97.667;
        168.00	67.201;
        172.00	85.884;
        172.00	82.017;
        176.00	84.2;
        176.00	65.024;
        176.00	102.63;
        179.00	105.146;
        188.00	103.281];
data.LWw(:,1) = data.LWw(:,1)./10;  %convert mm to cm
units.LWw   = {'cm', 'g'};  label.LWw = {'shell height', 'wet weight'};  
bibkey.LWw = 'Matz2013';
comment.LWw = 'obtained from mussels collected in Strawberry Hill, Oregon, USA during Summer 2012 From LOW intertidal individuals only (i.e. subtidal)';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'This entry is discussed in MatzMont2014';
metaData.bibkey.F1 = 'MatzMont2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45GKH'; % Cat of Life
metaData.links.id_ITIS = '79455'; % ITIS
metaData.links.id_EoL = '449960'; % Ency of Life
metaData.links.id_Wiki = 'Mytilus_californianus'; % Wikipedia
metaData.links.id_ADW = 'Mytilus_californianus'; % ADW
metaData.links.id_Taxo = '39225'; % Taxonomicon
metaData.links.id_WoRMS = '367837'; % WoRMS
metaData.links.id_molluscabase = '367837'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilus_californianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FoxCoe1943'; type = 'Article'; bib = [ ... 
'author = {Fox, D. L. and Coe, W. R.}, ' ... 
'year = {1943}, ' ...
'title = {Biology of the {C}alifornia Sea-mussel (\emph{Mytilus californianus}) II. {N}utrition, Metabolism, Growth and Calcium deposition}, ' ...
'journal = {J. Exp. Zool.}, ' ...
'volume = {93}, ' ...
'pages = {205--249}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Payn1976'; type = 'Article'; bib = [ ... 
'author = {Payne, R. T.}, ' ... 
'year = {1976}, ' ...
'title = {Biological observations on a subtidal \emph{Mytilus californianus} bed}, ' ...
'journal = {Veliger}, ' ...
'volume = {19}, ' ...
'pages = {125--130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schm1999'; type = 'Article'; bib = [ ... 
'author = {Schmidt, D.}, ' ... 
'year = {1999}, ' ...
'title = {A Rewiev of {C}alifornia Mussel (\emph{Mytilus californianus}); {F}isheries Biology and Fisheries Programs}, ' ...
'journal = {Fisheries and Oceans Canada}, ' ...
'volume = {99/187}, ' ...
'pages = {1--32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Such1981'; type = 'Article'; bib = [ ... 
'author = {Suchanek, T. H.}, ' ... 
'year = {1981}, ' ...
'title = {The role of disturbance in the evolution of life history strategies in the intertidal mussels \emph{Mytilus edulis} and \emph{Mytilus californianus}}, ' ...
'journal = {Oecologia}, ' ...
'volume = {50}, ' ...
'pages = {143--152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MatzMont2014'; type = 'Article'; bib = [ ... 
'author = {Matzelle, A. and Montalto, V. and Sar\`{a}, G. and Zippay, M. and Helmuth, B.}, ' ... 
'year = {2014}, ' ...
'title = {Dynamic {E}nergy {B}udget model parameter estimation for the bivalve \emph{Mytilus californianus}: {A}pplication of the covariation method.}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {105--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Matz2013'; type = 'Misc'; bib = [ ... 
'author = {Allison Matzelle}, ' ... 
'year = {2013}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

