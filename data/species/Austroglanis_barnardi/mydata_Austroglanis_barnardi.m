  function [data, auxData, metaData, txtData, weights] = mydata_Austroglanis_barnardi
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Austroglanididae';
metaData.species    = 'Austroglanis_barnardi'; 
metaData.species_en = 'Barnard''s rock-catfish'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 108];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 08];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Mtho2009';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'Mtho2009';
data.Li = 8.6;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Mtho2009';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 1.18;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = {'fishbase','Mtho2009'};
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 6.9;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Mtho2009';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.086	4.006
0.371	3.669
0.485	3.265
0.513	4.140
0.542	3.568
0.543	4.578
0.627	4.039
0.656	4.679
0.684	4.308
0.713	5.251
0.742	3.433
0.827	3.803
0.828	4.241
0.856	4.914
0.884	3.937
0.885	4.510
1.084	5.250
1.711	6.124
1.740	5.990
1.741	4.811
1.797	5.585
1.854	5.114
2.053	5.989
2.282	5.652
2.510	5.853
2.538	5.314
2.567	6.325
2.681	5.718
2.909	5.280
2.995	5.953
3.052	5.717
3.053	5.381
3.054	5.111
3.308	6.996
3.537	5.784
3.565	6.356
3.566	6.255
3.594	5.481
3.651	5.986
4.107	5.749
4.506	6.287
4.763	6.387
4.791	5.747
4.877	5.882
4.963	6.319
5.048	6.050
5.561	6.958
5.590	7.126
5.619	5.577
5.704	6.082
5.733	6.789
5.904	6.149
5.932	7.227
6.930	6.551
7.358	6.819
7.729	6.347
7.900	6.179
7.929	6.549
8.898	7.220
11.636	6.911
11.893	6.642
11.950	7.147
12.520	8.761
14.517	7.175];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','females'};  
temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mtho2009'; comment.tL_f = 'data from Noordhoek';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.281	5.547
0.298	3.880
0.352	3.759
0.522	4.760
0.656	4.245
0.680	3.640
0.683	4.124
0.718	5.397
0.719	5.488
0.820	4.186
0.823	4.640
0.874	3.913
1.535	4.643
1.677	5.311
1.702	4.947
1.782	4.644
1.842	5.493
2.031	5.039
2.083	4.646
2.556	5.769
2.635	5.284
2.825	5.012
2.856	5.558
2.994	5.650
2.995	5.831
2.996	5.983
3.572	6.076
3.715	7.168
3.763	5.956
4.010	6.078
4.032	5.260
4.068	6.533
4.286	6.473
4.777	5.991
4.780	6.627
4.807	6.415
4.912	5.749
4.969	6.082
5.297	5.963
5.573	6.267
5.575	6.661
5.874	6.268
5.957	6.450
6.479	6.695
6.671	6.575
6.755	6.908
6.839	7.181
6.944	6.424
7.767	6.670
8.532	6.310
8.591	6.977
8.887	6.160
9.109	6.646
9.986	6.619
10.896	7.623
12.591	6.994];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','males'};  
temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mtho2009'; comment.tL_m = 'data from Noordhoek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 5;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JWMV'; % Cat of Life
metaData.links.id_ITIS = '639923'; % ITIS
metaData.links.id_EoL = '204567'; % Ency of Life
metaData.links.id_Wiki = 'Austroglanis_barnardi'; % Wikipedia
metaData.links.id_ADW = 'Austroglanis_barnardi'; % ADW
metaData.links.id_Taxo = '162710'; % Taxonomicon
metaData.links.id_WoRMS = '1012367'; % WoRMS
metaData.links.id_fishbase = 'Austroglanis-barnardi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Austroglanis_barnardi}}';  
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
bibkey = 'Mtho2009'; type = 'phdthesis'; bib = [ ...
'author = {Vsi Gedla Mthombeni}, ' ...
'year = {2009}, ' ...
'title = {The biology of \emph{Austroglanis gilli} and \emph{Austroglanis barnardi} ({S}iluriformes: {A}ustroglanididae) in the {O}lifants {R}iver system, {S}outh {A}frica}, ' ... 
'journal = {International Journal of Molecular Sciences}, ' ...
'school = {Rhodes University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Austroglanis-barnardi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

