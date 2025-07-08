function [data, auxData, metaData, txtData, weights] = mydata_Euproctus_platycephalus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Euproctus_platycephalus'; 
metaData.species_en = 'Sardinian brook salamander';

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', '0jTf'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab_T'; 'aj_T'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 20];

%% set data
% zero-variate data;
data.ab_15 = 37.6;       units.ab_15 = 'd';    label.ab_15 = 'age at birth'; bibkey.ab_15 = 'amphibiaweb';
  temp.ab_15 = C2K(15); units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_24 = 12.7;       units.ab_24 = 'd';    label.ab_24 = 'age at birth'; bibkey.ab_24 = 'amphibiaweb';
  temp.ab_24 = C2K(24.5); units.temp.ab_24 = 'K'; label.temp.ab_24 = 'temperature';
data.tj_15 = 415;       units.tj_15 = 'd';    label.tj_15 = 'time since birth at metam'; bibkey.tj_15 = 'amphibiaweb';
  temp.tj_15 = C2K(15); units.temp.tj_15 = 'K'; label.temp.tj_15 = 'temperature';
  comment.tj_15 = '376-453 d';
data.tj_20 = 210;       units.tj_20 = 'd';    label.tj_20 = 'time since birth at metam'; bibkey.tj_20 = 'amphibiaweb';
  temp.tj_20 = C2K(20.5); units.temp.tj_20 = 'K'; label.temp.tj_20 = 'temperature';
  comment.tj_20 = '184-260 d';
data.tp = 4*365;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoveSotg2003';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'amphibiaweb';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.479;      units.Lb = 'cm';   label.Lb = 'SVL at birth';  bibkey.Lb = 'amphibiaweb';
  comment.Lb = 'converted from TL 8.8 to 14.5 mm, using F1';
data.Lj = 1.13;       units.Lj = 'cm';   label.Lj = 'SVL at metam';  bibkey.Lj = 'guess';
  comment.Lj = 'converted from TL 20 to 35 mm, using F1';
data.Lp = 3.6;       units.Lp = 'cm';   label.Lp = 'SVL at puberty';  bibkey.Lp = 'guess';
data.Li = 4.74;       units.Li = 'cm';   label.Li = 'ultimate SVL for females';  bibkey.Li = 'amphibiaweb';
  comment.Li = 'beased on TL 100-130 mm, converted to SVL using F1';
data.Lim = 5.35;       units.Lim = 'cm';   label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'amphibiaweb';
  comment.Li = 'TL males 120-140 mm, converted to SVL using F1 ';

data.Wwb = 0.0141;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3'; 
data.Wwp = 0.71;       units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 2.9;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'BoveSotg2003';
data.Wwim = 5.1;       units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'BoveSotg2003';

data.Ri  = 125/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '57 to 221 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tLN = [ ... % time since birth (d), SVL (cm)
4.038	5.519
4.041	5.025
4.043	4.643
4.044	4.530
4.045	4.304
4.073	3.597
4.089	4.813
4.089	4.742
5.020	5.605
5.024	4.870
5.044	5.549
5.044	5.478
5.045	5.393
5.046	5.210
5.046	5.139
5.047	5.040
5.047	4.984
5.047	4.927
5.048	4.828
5.049	4.729
5.049	4.630
5.061	6.524
5.063	6.171
5.066	5.719
5.074	4.404
5.086	6.298
6.019	6.794
6.022	6.186
6.023	6.016
6.024	5.889
6.025	5.804
6.026	5.607
6.026	5.536
6.027	5.324
6.028	5.225
6.030	4.942
6.031	4.801
6.031	4.702
6.044	6.511
7.024	6.908
7.028	6.300
7.028	6.187
7.029	6.117
7.030	5.905
7.030	5.820
7.032	5.551
7.032	5.537
7.032	5.481
7.033	5.367
7.034	5.212
7.034	5.198
7.035	5.028
7.054	5.721
7.079	5.438
7.562	6.880
7.563	6.725
7.587	6.584
7.965	6.047
7.989	5.991
7.989	5.948
7.989	5.877
7.990	5.821
7.990	5.821
8.009	6.471
8.010	6.302
8.014	5.708
8.031	6.796
8.039	5.284
8.053	6.966
8.054	6.853
8.062	5.496
8.064	5.143
8.991	6.614
8.993	6.289
8.993	6.232
8.994	6.006
9.000	5.002
9.042	5.893
9.042	5.794
9.043	5.681
9.043	5.624
9.043	5.596
9.044	5.483
9.045	5.398
9.974	6.403
9.975	6.318
9.997	6.459
10.000	5.950
10.001	5.894
10.001	5.809
10.003	5.498
10.019	6.799
10.955	6.771
11.031	5.711
11.986	6.476
12.012	5.995
12.991	6.576
12.991	6.519];
data.tLN(:,1) = data.tLN(:,1) * 365; % convert yr to d
units.tLN  = {'d', 'cm'};  label.tLN = {'time since birth', 'SVL', 'northern pop'};  
temp.tLN   = C2K(12);  units.temp.tLN = 'K'; label.temp.tLN = 'temperature';
bibkey.tLN = 'AngeSotg2015';
%
data.tLS = [ ... % time since birth (d), SVL (cm)
2.032	3.487
4.010	4.319
4.010	4.419
4.029	3.559
4.030	3.674
4.030	3.774
4.030	3.803
4.031	3.903
4.032	4.018
4.032	4.075
4.095	2.885
4.098	3.258
4.098	3.315
4.976	4.935
5.018	4.061
5.019	4.161
5.021	4.534
5.021	4.591
5.036	3.186
5.038	3.487
5.039	3.573
5.039	3.703
5.040	3.803
5.041	3.889
5.041	3.961
5.043	4.319
5.045	4.677
5.046	4.864
6.049	3.703
6.050	3.903
6.051	3.961
6.051	4.061
6.052	4.118
6.052	4.190
6.054	4.477
6.054	4.520
6.055	4.606
6.056	4.821
6.056	4.864
6.056	4.907
6.057	4.978
6.070	3.287
6.071	3.387
6.072	3.502
6.076	4.276
6.081	5.079
7.012	3.688
7.013	3.817
7.014	3.975
7.014	4.047
7.015	4.133
7.015	4.204
7.016	4.434
7.017	4.505
7.017	4.591
7.037	3.889
8.029	4.935
8.029	4.950
8.035	5.996
8.036	6.054
8.047	3.918
8.047	4.047
8.050	4.419
8.050	4.477
8.051	4.735
8.053	4.993
8.053	5.065
8.054	5.122
8.074	4.520
9.018	5.366
9.018	5.452
9.037	4.620
9.038	4.778
9.038	4.849
10.043	3.903
10.049	5.022
12.021	4.878
12.021	4.935
12.048	5.523
12.048	5.552
13.031	4.978
13.032	5.036
13.034	5.509
13.035	5.566];
data.tLS(:,1) = data.tLS(:,1) * 365; % convert yr to d
units.tLS  = {'d', 'cm'};  label.tLS = {'time since birth', 'SVL', 'southern pop'};  
temp.tLS   = C2K(14);  units.temp.tLS = 'K'; label.temp.tLS = 'temperature';
bibkey.tLS = 'AngeSotg2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tLN = 3 * weights.tLN;
weights.tLS = 3 * weights.tLS;
weights.Li = 5 * weights.Li;
weights.Lb = 0 * weights.Lb;
weights.Lj = 0 * weights.Lj;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLN','tLS'}; subtitle1 = {'Data for northern, southern populations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Some temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% facts
F1 = 'length-length: TL 85 mm corresponds with SVL 35 mm, so SVL = 0.4118*TL';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3CY49'; % Cat of Life
metaData.links.id_ITIS = '668373'; % ITIS
metaData.links.id_EoL = '330509'; % Ency of Life
metaData.links.id_Wiki = 'Euproctus_platycephalus'; % Wikipedia
metaData.links.id_ADW = 'Euproctus_platycephalus'; % ADW
metaData.links.id_Taxo = '47284'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Euproctus+platycephalus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euproctus_platycephalus}}';   
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
bibkey = 'AngeSotg2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10682-014-9717-8}, ' ...
'author = {Claudio Angelini and Giuseppe Sotgiu and Giulia Tessa and Jon Bielby and Stefano Doglio and Marco Favelli and Trenton W. J. Garner and Enrico Gazzaniga and Cristina Giacoma and Stefano Bovero}, ' ... 
 'year = {2015}, ' ...
'title = {Environmentally determined juvenile growth rates dictate the degree of sexual size dimorphism in the {S}ardinian brook newt}, ' ...
'journal = {Evol, Ecol.}, ' ...
'volume = {29}, ' ...
'pages = {169–184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoveSotg2003'; type = 'Article'; bib = [ ... 
'author = {S. Bovero and G. Sotgiu and S. Castellano and C. Giacoma}, ' ... 
'year = {2003}, ' ...
'title = {Age and Sexual Dimorphism in a Population of \emph{Euproctus platycephalus} ({C}audata: {S}alamandridae) from {S}ardinia}, ' ...
'journal = {Copeia}, ' ...
'volume = {2003(1)}, ' ...
'pages = {149-154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Euproctus+platycephalus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
