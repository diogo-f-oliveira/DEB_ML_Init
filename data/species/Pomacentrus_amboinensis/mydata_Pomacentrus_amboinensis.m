function [data, auxData, metaData, txtData, weights] = mydata_Pomacentrus_amboinensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Pomacentrus_amboinensis'; 
metaData.species_en = 'Ambon damselfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 01 30];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 
  
metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 30]; 


%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MurpLeis2007';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 290;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'KingOCal2017';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.26;   units.Lb  = 'cm';  label.Lb  = 'standard length at birth'; bibkey.Lb  = 'MurpLeis2007';  
data.Lj  = 1.20;   units.Lj  = 'cm';  label.Lj  = 'standard length at metam'; bibkey.Lj  = 'MurpLeis2007';  
data.Lp  = 4.85;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'JoneMcCo2002'; 
data.Li  = 11.0;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'MurpLeis2007';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MurpLeis2007';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwj = 0.074;  units.Wwj = 'g';   label.Wwj = 'wet weight at puberty';   bibkey.Wwj = {'JoneMcCo2002','fishbase'};
  comment.Wwj = 'based on Wwp = 0.04394 * Lj^2.824, see F1, F2';
data.Wwp = 3.80;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'MurpLeis2007','fishbase'};
  comment.Wwp = 'based on Wwp = 0.04394 * Lp^2.824, see F1, F2';
data.Wwi = 38.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'MurpLeis2007','fishbase'};
  comment.Wwi = 'based on Wwi = 0.04394 * Li^2.824, see F1, F2';

data.Ri  = 444*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.025	0.266
0.025	0.288
0.050	0.260
0.973	0.299
0.998	0.310
0.998	0.321
1.946	0.310
1.996	0.326
2.021	0.243
2.969	0.354
2.969	0.365
2.969	0.382
2.969	0.387
2.969	0.409
3.992	0.302
3.992	0.326
3.992	0.343
3.992	0.354
3.992	0.382
4.965	0.409
4.965	0.429
4.965	0.432
4.965	0.443
4.990	0.465
4.990	0.498
6.013	0.415
6.013	0.437
6.038	0.445
6.038	0.457
6.961	0.437
6.986	0.448
6.986	0.470
7.011	0.490
8.009	0.445
8.009	0.457
8.009	0.468
8.009	0.487
8.009	0.512
8.957	0.556
8.982	0.434
8.982	0.520
8.982	0.540
9.007	0.498
9.980	0.515
9.980	0.526
10.005	0.498
10.005	0.587
10.978	0.564
10.978	0.575
11.003	0.545
11.028	0.600
11.028	0.631
11.028	0.642
11.028	0.661
11.053	0.692
11.053	0.722
11.951	0.728
11.976	0.703
11.976	0.711
11.976	0.753
11.976	0.766
11.976	0.780
11.976	0.794
11.976	0.858
12.026	0.564
12.999	0.689
12.999	0.733
12.999	0.786
12.999	0.797
12.999	0.811
12.999	0.830
13.024	0.758
13.024	0.769
13.024	0.775
13.972	0.675
13.972	0.700
13.972	0.755
13.972	0.775
13.972	0.802
13.972	0.860
13.972	0.863
13.972	0.877
13.972	0.885
13.972	0.902
13.972	0.919
13.997	0.849
14.022	0.830
14.970	0.844
14.970	0.866
14.970	0.874
14.995	0.885
14.995	0.902
14.995	0.957
14.995	0.966
15.968	0.943
15.968	0.960
15.968	0.971
15.968	0.996
16.966	0.899
16.966	0.921
16.966	0.957
16.966	0.974
16.966	0.982
16.966	0.988
16.966	1.010
16.966	1.024
16.966	1.104
16.991	0.949
16.991	1.051
17.964	0.863
17.964	0.894
17.964	1.054
17.964	1.126
17.964	1.154
17.989	0.836
17.989	0.916
17.989	0.924
17.989	0.941
17.989	0.982
17.989	0.993
17.989	1.007
18.014	0.968
18.962	1.051
18.962	1.068
18.962	1.085
18.962	1.096
18.962	1.109
18.962	1.123
18.962	1.143
18.987	0.977
19.012	0.924
19.960	1.024
19.960	1.043
19.960	1.060
19.985	1.195
20.010	1.129
20.010	1.143
20.010	1.159
20.035	1.082
20.060	1.118
20.983	1.071
20.983	1.079
20.983	1.096
20.983	1.109
20.983	1.121
20.983	1.145
20.983	1.170
20.983	1.184
20.983	1.198
20.983	1.215
21.956	1.065
21.956	1.112
21.956	1.118
21.956	1.134
21.981	1.157
21.981	1.168
21.981	1.187
21.981	1.262
22.979	1.262
23.004	1.195
23.004	1.217];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'MurpLeis2007'};

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.tL = 5 * weights.tL;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-weight:  (W in g) = 0.04394 * (standard length in cm)^2.824; Error in  fishbase: FL must be SL!';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Fork-Standard length: LS =  0.8 * LF, based on photo';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6W6GG'; % Cat of Life
metaData.links.id_ITIS = '170151'; % ITIS
metaData.links.id_EoL = '46572413'; % Ency of Life
metaData.links.id_Wiki = 'Pomacentrus_amboinensis'; % Wikipedia
metaData.links.id_ADW = 'Pomacentrus_amboinensis'; % ADW
metaData.links.id_Taxo = '184427'; % Taxonomicon
metaData.links.id_WoRMS = '277132'; % WoRMS
metaData.links.id_fishbase = 'Pomacentrus-amboinensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacentrus_amboinensis}}';
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
bibkey = 'MurpLeis2007'; type = 'Article'; bib = [ ... 
'author = {B. F. Murphy and J. M. Leis and K. D. Kavanagh}, ' ... 
'year = {2007}, ' ...
'title = {Larval development of the {A}mbon damselfish \emph{Pomacentrus amboinensis}, with a summary of pomacentrid development}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {71}, ' ...
'pages = {569-584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneMcCo2002'; type = 'Incollection'; bib = [ ... 
'author = {Jones, G. P. and McCormick, M. I.}, ' ... 
'year = {2002}, ' ...
'editor = {P. F. Sale}, ' ...
'publisher = {Academic Press}, ' ... 
'title = {Numerical and energetic Processes in the Ecology of coral Reef Fishes}, ' ...
'booktitle = {Coral reef fishes}, ' ...
'chapter = {10}, ' ...
'pages = {221--242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KingOCal2017'; type = 'Article'; bib = [ ... 
'author = {M. J. Kingsford and M. D. O''Callaghan and L. Liggins and G. Gerlach}, ' ... 
'year = {2017}, ' ...
'title = {The short-lived neon damsel \emph{Pomacentrus coelestis}: implications for population dynamics}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {90}, ' ...
'pages = {2041--2059}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/5715}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
