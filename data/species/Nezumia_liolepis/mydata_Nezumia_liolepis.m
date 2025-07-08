function [data, auxData, metaData, txtData, weights] = mydata_Nezumia_liolepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Nezumia_liolepis'; 
metaData.species_en = 'Smooth grenadier'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 30];

%% set data
% zero-variate data

data.am = 9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'HoffBuck2000';   
  temp.am = C2K(4.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on PAL 3.5 cm';
data.Li  = 30.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'FernRami2013';
  comment.Wwb = 'based on egg diameter of 1.3 mm of Nezumia_aequalis: pi/6*0.13^3';
data.Wwp = 3.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00166*Lp^3.12, see F1';  
data.Wwi = 90;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data, 0.00166*Li^3.12 gives 71 g, see F1';

data.Ri  = 10630/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'FernRami2013';   
  temp.Ri = C2K(4.1);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nezumia_aequalis';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), pre-anal length (cm)
2.951	6.815
3.000	5.307
3.002	4.249
3.003	4.127
3.004	3.902
3.043	6.295
3.936	5.572
3.957	5.849
3.958	5.728
3.977	7.063
3.978	6.768
3.980	6.040
3.983	5.052
3.984	4.687
4.000	7.202
4.001	6.907
4.002	6.526
4.003	6.213
4.004	6.005
4.005	5.364
4.006	4.809
4.022	7.601
4.023	7.462
4.025	6.335
4.963	5.507
4.965	4.987
4.966	4.536
4.981	7.138
4.982	7.051
4.983	6.895
4.984	6.843
4.986	5.750
5.006	6.548
5.007	6.271
5.008	5.993
5.009	5.785
5.012	4.363
5.029	6.670
5.030	6.045
5.050	7.207
5.054	5.647
5.072	7.468
5.985	7.611
5.986	7.195
5.987	7.160
5.988	6.969
5.989	6.571
5.990	5.894
6.009	7.368
6.010	7.091
6.012	6.068
6.014	5.322
6.991	6.992
7.015	6.645
7.062	6.351
7.063	6.195
7.064	6.160
7.994	7.622
7.996	7.171
8.020	6.685
8.064	7.327
9.020	8.216
9.025	6.222
9.047	6.812];
data.tL(:,1) = 365*(0.5+data.tL(:,1)); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'pre-anal length'};  
temp.tL   = C2K(4.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HoffBuck2000';

% length-length
data.LL = [ ... % pre-nal length (cm), total length (cm)
3.903	13.820
4.097	15.627
4.289	15.779
4.521	18.464
4.655	17.686
4.731	17.063
4.981	17.731
5.060	20.109
5.312	22.949
5.386	20.620
5.521	21.031
5.754	23.820
5.769	20.613
5.771	22.061
5.926	23.351
5.942	20.713
6.001	22.212
6.041	23.504
6.075	19.573
6.097	22.107
6.117	23.089
6.230	20.811
6.233	23.604
6.251	22.931
6.269	21.948
6.326	21.533
6.327	22.568
6.502	24.323
6.519	22.875
6.522	25.047
6.540	24.529
6.558	23.133
6.580	25.511
6.617	24.424
6.712	24.009
6.746	20.077
6.789	24.473
6.790	24.887
6.810	25.662
6.827	23.955
6.828	24.576
6.886	24.937
6.902	22.609
6.942	23.953
6.962	24.418
6.983	26.125
7.018	23.538
7.019	24.313
7.039	25.503
7.058	24.623
7.114	23.484
7.116	25.398
7.117	26.225
7.134	24.415
7.138	27.622
7.154	25.035
7.173	24.724
7.175	26.897
7.193	25.396
7.194	26.534
7.348	26.997
7.402	24.099
7.404	25.496
7.423	26.116
7.441	25.030
7.443	26.892
7.482	27.408
7.558	26.838
7.560	28.338
7.617	27.871
8.193	29.360
8.420	25.891];
units.LL  = {'cm', 'cm'};  label.LL = {'pre-anal length', 'total length'};  
bibkey.LL = 'HoffBuck2000';

% length-weight
data.LW = [ ... % pre-anal length (cm), weight (g)
3.941	5.113
4.153	9.793
4.556	14.907
4.667	10.497
4.778	12.609
4.980	12.891
5.050	16.069
5.393	21.797
5.544	25.421
5.736	33.288
5.736	31.620
5.736	23.126
5.857	25.085
5.958	21.737
5.988	39.784
5.988	24.616
6.049	29.615
6.119	36.736
6.119	34.613
6.230	40.972
6.240	22.921
6.251	33.841
6.311	37.778
6.341	33.831
6.351	35.954
6.361	30.492
6.533	35.480
6.543	44.124
6.543	42.001
6.553	40.483
6.593	45.332
6.624	53.368
6.694	35.918
6.704	49.113
6.805	41.367
6.815	49.556
6.815	47.736
6.815	46.067
6.856	38.024
6.906	41.508
6.936	62.739
6.936	48.330
6.987	52.875
7.017	57.119
7.027	63.943
7.027	39.675
7.047	43.313
7.118	50.283
7.128	61.506
7.128	48.917
7.128	44.518
7.148	46.336
7.168	71.209
7.178	57.253
7.199	62.257
7.199	52.853
7.209	70.446
7.209	51.183
7.269	58.002
7.390	59.051
7.421	52.678
7.431	57.530
7.431	55.255
7.461	44.028
7.471	65.413
7.552	73.747
7.592	77.383
7.602	54.934
7.673	71.914
8.187	90.516
8.399	75.327];
units.LW  = {'cm', 'cm'};  label.LW = {'pre-anal length', 'weight'};  
bibkey.LW = 'HoffBuck2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00166*(TL in mm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47C2Y'; % Cat of Life
metaData.links.id_ITIS = '165394'; % ITIS
metaData.links.id_EoL = '46564626'; % Ency of Life
metaData.links.id_Wiki = 'Nezumia_aequalis'; % Wikipedia
metaData.links.id_ADW = 'Nezumia_aequalis'; % ADW
metaData.links.id_Taxo = '181273'; % Taxonomicon
metaData.links.id_WoRMS = '126473'; % WoRMS
metaData.links.id_fishbase = 'Nezumia-aequalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nezumia_aequalis}}';
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
bibkey = 'HoffBuck2000'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2000.tb00267.x}, ' ...
'author = {Hoff, G. R. and Buckley, T. W. and Drazen, J. C. and Duncan, K. M.}, ' ... 
'year = {2000}, ' ...
'title = {Biology and ecology of \emph{Nezumia liolepis} and \emph{N. stelgidolepis} from the west coast of North America}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {57(3)}, ' ...
'pages = {662–680}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FernRami2013'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.dsr2.2013.03.003}, ' ...
'author = {MU. Fernandez-Arcayaa and E. Ramirez-Llodra and G. Rotllant and L. Recasens and H. Murua and I. Quaggio-Grassiotto and J.B. Company}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of two macrourid fish, \emph{Nezumia aequalis} and \emph{Coelorinchus mediterraneus}, inhabiting the {NW} {M}editerranean continental margin (400–2000 m)}, ' ...
'journal = {Deep Sea Research Part II: Topical Studies in Oceanography}, ' ...
'volume = {92}, ' ...
'pages = {63-72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Nezumia-sclerorhynchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

